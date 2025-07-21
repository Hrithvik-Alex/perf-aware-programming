// @NOTE(BDJ): Resources:
//     - ARM ABI: https://github.com/ARM-software/abi-aa (see "Procedure Call Standard for the Arm 64-bit Architecture")
//     - Apple's ARM64 ABI: https://developer.apple.com/documentation/xcode/writing-arm64-code-for-apple-platforms
//     - ARM instruction reference: https://developer.arm.com/documentation/dui0802/b/A64-General-Instructions
//     - clang/GNU assembler syntax reference: https://developer.arm.com/documentation/100068/0622/Migrating-from-armasm-to-the-armclang-Integrated-Assembler/Overview-of-differences-between-armasm-and-GNU-syntax-assembly-code
// 
// There are a few minor assembler syntax differences compared to NASM:
//
//     - all label names have to be unique--including loop labels
//     - no leading `.` in front of labels
//     - `global` -> `.global`
//     - `section .text` -> `.text`
//     - the end of an assembly file is marked with `.end`
//     - conventionally ARM assembly files have a `.s` file extension
//
// To satisfy Apple's ARM64 toolchain and ABI, we also need to:
//
//     - prepend global symbol names with an underscore
//     - align the first instruction in a function to an 8-byte boundary (using `.balign`)

.global _MOVAllBytesASM
.global _NOPAllBytesASM
.global _CMPAllBytesASM
.global _DECAllBytesASM

.text

// @NOTE(BDJ): On ARM64, the first 8 parameters to a function are passed
// in registers x0-x7. x9-x15 are available as temporary registers. So--
//
//     x0 holds the count
//     x1 holds the base data pointer

.balign 8
_MOVAllBytesASM:
	eor x9, x9, x9
loop_mov:
	strb w9, [x1, x9]
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_mov
	ret

// @NOTE(BDJ): There is no variable-length `nop` instruction in ARM64. But there are SOME variable-length instructions!
.balign 8
_NOPAllBytesASM:
	eor x9, x9, x9
loop_nop:
	nop
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_nop
	ret

.balign 8
_CMPAllBytesASM:
	eor x9, x9, x9
loop_cmp:
	add x9, x9, #1
	cmp x9, x0
	b.lo loop_cmp
	ret

.balign 8
_DECAllBytesASM:
loop_sub:
	sub x0, x0, #1
	cbnz x0, loop_sub
	ret
.end
