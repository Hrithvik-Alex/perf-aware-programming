#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

struct Register
{
    u_int8_t memory_index;
    char name[3];
    bool wide;
};

struct Register reg_lookup_table[2][8] = {
    {{0, "al", false},
     {1, "cl", false},
     {2, "dl", false},
     {3, "bl", false},
     {0, "ah", false},
     {1, "ch", false},
     {2, "dh", false},
     {3, "bh", false}},
    {{0, "ax", true},
     {1, "cx", true},
     {2, "dx", true},
     {3, "bx", true},
     {4, "sp", true},
     {5, "bp", true},
     {6, "si", true},
     {7, "di", true}}};

const char *eff_acc_table[8] = {
    "bx + si", "bx + di", "bp + si", "bp + di", "si", "di", "bp", "bx"};

const char *arith_instr[8] = {
    "add", "or", "adc", "sbb", "and", "sub", "xor", "cmp"};

const char *jump_commands[16] = {
    "jo", "jno", "jb", "jnb", "je", "jne", "jbe", "jnbe", "js", "jns", "jp", "jnp", "jl", "jnl", "jle", "jnle"};

const char *other_comp_commands[4] = {
    "loopnz", "loopz", "loop", "jcxz"};

u_int16_t register_mem[8] = {0, 0, 0, 0, 0, 0, 0, 0};

u_int16_t instruction_pointer;
u_int16_t instruction_size;

bool sign_flag = 0;
bool zero_flag = 0;

u_int8_t instruction_memory[1024];
u_int8_t program_memory[65536];

size_t num_cycles;

int calc_effective_address(int index)
{
    int result;
    switch (index)
    {
    case 0:
    {
        result = register_mem[3] + register_mem[6];
        break;
    }
    case 1:
    {
        result = register_mem[3] + register_mem[7];
        break;
    }
    case 2:
    {
        result = register_mem[5] + register_mem[6];
        break;
    }
    case 3:
    {
        result = register_mem[5] + register_mem[7];
        break;
    }
    case 4:
    {
        result = register_mem[6];
        break;
    }
    case 5:
    {
        result = register_mem[7];
        break;
    }
    case 6:
    {
        result = register_mem[5];
        break;
    }
    case 7:
    {
        result = register_mem[3];
        break;
    }
    }

    return result;
}

int get_signed_number(int data_lo, int data_hi, bool wide)
{
    int data = data_lo;
    if (wide)
    {
        data += 256 * data_hi;

        if (data & (1 << 15))
        {
            return -1 * (32768 - (data & ~(1 << 15)));
        }
    }
    else
    {

        if (data & (1 << 7))
        {
            return -1 * (128 - (data & ~(1 << 7)));
        }
    }

    return data;
}

int get_num_from_file(bool wide, bool sign_extend, FILE *file)
{
    unsigned char num_lo;
    unsigned char num_hi;

    num_lo = instruction_memory[instruction_pointer++];
    if (wide && !sign_extend)
    {
        num_hi = instruction_memory[instruction_pointer++];
    }

    return get_signed_number((int)num_lo, (int)num_hi, wide && !sign_extend);
}

int create_mem_reg_str(FILE *file, char mod, char r_m, bool w, char *str)
{
    int disp;
    switch (mod)
    {
    case 3:
        memcpy(str, reg_lookup_table[w][r_m].name, sizeof(reg_lookup_table[w][r_m].name));
        break;
    case 2:
    case 1:
    {
        bool wide = mod % 2 == 0;
        char *reg = eff_acc_table[r_m];
        disp = get_num_from_file(wide, false, file);

        if (disp < 0)
        {
            sprintf(str, "[%s - %d]", reg, -1 * disp);
        }
        else if (disp > 0)
        {
            sprintf(str, "[%s + %d]", reg, disp);
        }
        else
        {
            sprintf(str, "[%s]", reg);
        }
        break;
    }

    case 0:
    {

        if (r_m == 6)
        {
            int addr = get_num_from_file(true, false, file);
            disp = addr;
            sprintf(str, "[%d]", addr);
        }
        else
        {

            disp = 0;
            char *reg = eff_acc_table[r_m];
            sprintf(str, "[%s]", reg);
        }
        break;
    }
    }

    return disp;
}

void print_maybe_flip(char *instr, char *reg, char *mem_reg_str, bool d)
{
    if (d == 0)
    {
        printf("%s %s, %s\n", instr, mem_reg_str, reg);
    }
    else
    {
        printf("%s %s, %s\n", instr, reg, mem_reg_str);
    }
}

void write_flags(u_int16_t data)
{
    if (data & 0x8000)
    {
        sign_flag = 1;
    }
    else
    {
        sign_flag = 0;
    }

    if (data == 0)
    {
        zero_flag = 1;
    }
    else
    {
        zero_flag = 0;
    }
}

void perform_instruction_reg(u_int8_t instr_idx, u_int8_t rto, u_int16_t value)
{
    switch (instr_idx)
    {
    case 0: // ADD
    {
        u_int16_t result = register_mem[rto] + value;
        register_mem[rto] = result;
        write_flags(result);
        break;
    }
    case 5: // SUB
    {
        u_int16_t result = register_mem[rto] - value;
        register_mem[rto] = result;
        write_flags(result);
        break;
    }
    case 7: // CMP
    {
        u_int16_t result = register_mem[rto] - value;
        write_flags(result);
    }
    default:
        break;
    }
}

void mov_instruction_mem(u_int8_t offset_idx, bool d, struct Register reg, int value, u_int16_t offset, int mod)
{

    int address = ((mod == 0 && offset_idx == 6) ? 0 : calc_effective_address(offset_idx)) + offset;

    if (d == 1)
    {
        u_int16_t low = program_memory[address];
        u_int16_t high = program_memory[address + 1];
        register_mem[reg.memory_index] = (high << 8) + low;
    }
    else
    {
        program_memory[address] = value & 0xFF;
        program_memory[address + 1] = value >> 8;
    }
}

void calc_effective_address_cycles(u_int8_t r_m, u_int16_t mod, u_int16_t disp)
{

    if (mod == 0 && r_m == 6)
    {
        num_cycles += 6;
    }
    else
    {
        if (r_m == 0 || r_m == 3)
        {
            if (disp > 0)
            {
                num_cycles += 11;
            }
            else
            {
                num_cycles += 7;
            }
        }
        else if (r_m == 1 || r_m == 2)
        {
            if (disp > 0)
            {
                num_cycles += 12;
            }
            else
            {
                num_cycles += 8;
            }
        }
        else
        {
            if (disp > 0)
            {
                num_cycles += 9;
            }
            else
            {
                num_cycles += 5;
            }
        }
    }
}

int main(int argc, char **argv)
{

    // File handling
    if (argc != 2)
    {
        printf("Wrong number of arguments!\n");
        exit(1);
    }

    char *filename = argv[1];
    FILE *file = fopen(filename, "rb");

    if (file == NULL)
    {
        printf("Error opening file %s\n", filename);
        exit(1);
    }

    instruction_size = fread(instruction_memory, 1, sizeof(instruction_memory), file);
    if (instruction_size == 0)
    {
        printf("Error reading file or file is empty\n");
        exit(1);
    }

    instruction_pointer = 0;
    num_cycles = 0;

    // constants
    unsigned char instr_1;
    unsigned char instr_2;
    unsigned char disp_lo;
    unsigned char disp_hi;
    unsigned char data_lo;
    unsigned char data_hi;

    const unsigned char MOV_REG_MEM = 0x22;
    const unsigned char MOV_IMM_RGM = 0x63;
    const unsigned char MOV_IMM_REG = 0xB;
    const unsigned char MOV_MEM_ACC = 0x28;

    const unsigned char LOOP = 0xE2;
    const unsigned char LOOPS = 0xE1;
    const unsigned char LOOPNZ = 0xE0;
    const unsigned char JCXZ = 0xE3;

    // main loop

    while (instruction_pointer < instruction_size)
    {
        u_int8_t instr_1 = instruction_memory[instruction_pointer++];
        if (instr_1 >> 2 == MOV_REG_MEM)
        {
            u_int8_t instr_2 = instruction_memory[instruction_pointer++];
            bool d = instr_1 & 2;
            bool w = instr_1 & 1;

            char mod = instr_2 >> 6;
            char reg = (instr_2 >> 3) & 7;
            char r_m = instr_2 & 7;

            struct Register reg_to = reg_lookup_table[w][reg];
            char *mem_reg = malloc(20);

            int disp = create_mem_reg_str(file, mod, r_m, w, mem_reg);
            print_maybe_flip("mov", reg_to.name, mem_reg, d);

            if (mod == 3)
            {
                if (d == 0)
                {

                    register_mem[r_m] = register_mem[reg_to.memory_index];
                }
                else
                {

                    register_mem[reg_to.memory_index] = register_mem[r_m];
                }
                num_cycles += 2;
            }
            else
            {
                mov_instruction_mem(r_m, d, reg_to, register_mem[reg_to.memory_index], disp, mod);
                calc_effective_address_cycles(r_m, mod, disp);
                if (d == 0)
                {
                    num_cycles += 9;
                }
                else
                {
                    num_cycles += 8;
                }
            }

            free(mem_reg);
        }
        else if (instr_1 >> 1 == MOV_IMM_RGM)
        {
            u_int8_t instr_2 = instruction_memory[instruction_pointer++];
            bool w = instr_1 & 1;

            char mod = instr_2 >> 6;
            char r_m = instr_2 & 7;

            char *to = malloc(20);

            int disp = create_mem_reg_str(file, mod, r_m, w, to);

            int data = get_num_from_file(w, false, file);

            if (mod == 3)
            {
                register_mem[reg_lookup_table[1][r_m].memory_index] = data;
                num_cycles += 4;
            }
            else
            {
                mov_instruction_mem(r_m, 0, reg_lookup_table[0][0], data, disp, mod);
                calc_effective_address_cycles(r_m, mod, disp);
                num_cycles += 10;
            }

            char num_info[5];
            if (w)
            {
                memcpy(num_info, "word", 5);
            }
            else
            {
                memcpy(num_info, "byte", 5);
            }
            printf("mov %s, %s %d\n", to, num_info, data);
            free(to);
        }
        else if (instr_1 >> 4 == MOV_IMM_REG)
        {
            bool w = (instr_1 >> 3) & 1;
            char reg = instr_1 & 7;
            struct Register actual_reg = reg_lookup_table[w][reg];
            int data = get_num_from_file(w, false, file);

            register_mem[actual_reg.memory_index] = (u_int16_t)data;

            printf("mov %s, %d\n", actual_reg.name, data);

            num_cycles += 4;
        }
        else if (instr_1 >> 2 == MOV_MEM_ACC)
        {

            bool d = instr_1 & 2;
            bool w = instr_1 & 1;
            // TODO fix sign
            int addr = get_num_from_file(w, false, file);

            char *reg;

            if (d)
            {
                printf("mov [%d], ax\n", addr);
            }
            else
            {
                printf("mov ax, [%d]\n", addr);
            }

            num_cycles += 10;
        }
        else if (instr_1 >> 6 == 0 && (instr_1 & (1 << 2)) == 0) // regular ADD, SUB, CMP, etc.
        {
            char instr_idx = (instr_1 >> 3) & 7;
            char *instr_name = arith_instr[instr_idx];
            bool d = instr_1 & 2;
            bool w = instr_1 & 1;

            u_int8_t instr_2 = instruction_memory[instruction_pointer++];
            char mod = instr_2 >> 6;
            char reg = (instr_2 >> 3) & 7;
            char r_m = instr_2 & 7;
            struct Register reg_to = reg_lookup_table[w][reg];
            char *mem_reg = malloc(20);

            int disp = create_mem_reg_str(file, mod, r_m, w, mem_reg);
            print_maybe_flip(instr_name, reg_to.name, mem_reg, d);

            int rto = reg_to.memory_index;
            int rfr = r_m;
            if (d == 0)
            {
                rfr = reg_to.memory_index;
                rto = r_m;
            }

            perform_instruction_reg(instr_idx, rto, register_mem[rfr]);

            free(mem_reg);

            if (mod == 3)
            {
                num_cycles += 3;
            }
            else
            {
                calc_effective_address_cycles(r_m, mod, disp);
                if (d == 0)
                {
                    num_cycles += 16;
                }
                else
                {
                    num_cycles += 9;
                }
            }
        }
        else if (instr_1 >> 2 == (1 << 5)) // immediate to reg/mem ADD, SUB, CMP, etc.
        {
            bool s = instr_1 & 2;
            bool w = instr_1 & 1;

            u_int8_t instr_2 = instruction_memory[instruction_pointer++];
            char mod = instr_2 >> 6;
            char instr_index = (instr_2 >> 3) & 7;
            char r_m = instr_2 & 7;

            char *instr_name = arith_instr[instr_index];

            char *to = malloc(20);

            int disp = create_mem_reg_str(file, mod, r_m, w, to);

            u_int16_t data = get_num_from_file(w, s, file);

            perform_instruction_reg(instr_index, r_m, data);

            printf("%s %s, %d\n", instr_name, to, data);
            free(to);

            if (mod == 3)
            {
                num_cycles += 4;
            }
            else
            {
                calc_effective_address_cycles(r_m, mod, disp);
                num_cycles += 17;
            }
        }
        else if (instr_1 >> 6 == 0 && ((instr_1 >> 1) & 3) == 2) // accumulator ADD, SUB, CMP, etc.
        {
            bool w = instr_1 & 1;
            char instr_idx = (instr_1 >> 3) & 7;
            char *instr_name = arith_instr[instr_idx];

            int data = get_num_from_file(w, false, file);

            struct Register acc;
            if (w)
            {
                acc = reg_lookup_table[1][0];
            }
            else
            {
                acc = reg_lookup_table[0][0];
            }

            perform_instruction_reg(instr_idx, acc.memory_index, data);

            printf("%s %s, %d\n", instr_name, acc.name, data);

            num_cycles += 4;
        }
        else if (instr_1 >> 4 == 7) // JUMP commands
        {
            char instr_index = instr_1 & 15;
            char *instr_name = jump_commands[instr_index];

            int data = get_num_from_file(false, false, file);

            switch (instr_index)
            {
            case 5: // jne
            {
                if (!zero_flag)
                {
                    instruction_pointer += data;
                }
                break;
            }
            }

            printf("%s %d\n", instr_name, data);
        }
        else if (instr_1 >> 4 == 0xE && (instr_1 & 15) < 4) // Other in jump
        {
            char instr_index = instr_1 & 3;
            char *instr_name = other_comp_commands[instr_index];

            int data = get_num_from_file(false, false, file);

            printf("%s %d\n", instr_name, data);
        }
        else
        {
            printf("unrecognized pattern %d\n", instr_1);
        }
    }

    for (int i = 0; i < 8; ++i)
    {
        printf("%s: %d\n", reg_lookup_table[1][i].name, register_mem[i]);
    }

    printf("INSTRUCTION POINTER: %d\n", instruction_pointer);

    printf("SIGNED FLAG: %d\n", sign_flag);
    printf("ZERO FLAG: %d\n", zero_flag);
    printf("CYCLES ELAPSED: %d\n", num_cycles);

    fclose(file);
    return 0;
}