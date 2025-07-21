
#include "../timing/repetition_tester.cc"
#include <cstdint>
#include <cstdio>
#include <sys/stat.h>

static void WriteToAllBytes(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;

    handle_allocation(Tester, Params, &DestBuffer);
    begin_time(Tester);

    u64 count = DestBuffer.count;
    uint8_t *data = DestBuffer.data;

    for (u64 Index = 0; Index < count; ++Index) {
      data[Index] = (uint8_t)Index;
    }
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

extern "C" void MOVAllBytesASM(u64 Count, uint8_t *Data);
extern "C" void NOPAllBytesASM(u64 Count);
extern "C" void CMPAllBytesASM(u64 Count);
extern "C" void DECAllBytesASM(u64 Count);

static void MOVAllBytes(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    MOVAllBytesASM(DestBuffer.count, DestBuffer.data);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

static void NOPAllBytes(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPAllBytesASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

static void CMPAllBytes(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    CMPAllBytesASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

static void DECAllBytes(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    DECAllBytesASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

typedef void read_overhead_test_func(RepetitionTester *Tester,
                                     ReadParameters *Params);

struct TestFunction {
  char const *Name;
  read_overhead_test_func *Func;
};
TestFunction TestFunctions[] = {
    {"WriteToAllBytes", WriteToAllBytes}, {"MOVAllBytes", MOVAllBytes},
    {"NOPAllBytes", NOPAllBytes},         {"CMPAllBytes", CMPAllBytes},
    {"DECAllBytes", DECAllBytes},
};

int main(int argc, char **argv) {

  if (argc != 2) {
    printf("Usage: %s [num_repetitions]\n", argv[0]);
    return 1;
  }

  size_t num_repetitions = atoi(argv[1]);

  RepetitionTester testers[5] = {};

  struct stat stat_res;
  stat("haversine_inp.json", &stat_res);

  ReadParameters Params = {};
  Params.Dest = allocate_buffer(stat_res.st_size, false);
  Params.FileName = "haversine_inp.json";
  Params.alloc_type = AllocType_malloc;

  for (;;) {

    for (u32 FuncIndex = 0; FuncIndex < 5; ++FuncIndex) {
      RepetitionTester *Tester = &testers[FuncIndex];
      TestFunction TestFunc = TestFunctions[FuncIndex];

      printf("\n--- %s ---\n", TestFunc.Name);
      init_tester(Tester, num_repetitions);
      TestFunc.Func(Tester, &Params);
      print_stats(Tester);
    }
  }
}
