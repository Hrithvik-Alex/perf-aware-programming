
#include "../timing/repetition_tester.cc"
#include <cstdint>
#include <cstdio>
#include <sys/stat.h>

extern "C" void NOPx1ASM(u64 Count);
extern "C" void NOPx2ASM(u64 Count);
extern "C" void NOPx3ASM(u64 Count);
extern "C" void NOPx4ASM(u64 Count);
extern "C" void NOPx5ASM(u64 Count);
extern "C" void NOPx6ASM(u64 Count);
extern "C" void NOPx7ASM(u64 Count);
extern "C" void NOPx8ASM(u64 Count);

static void NOPx1(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx1ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx2(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx2ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx3(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx3ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx4(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx4ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx5(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx5ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}

static void NOPx6(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx6ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx7(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx7ASM(DestBuffer.count);
    end_time(Tester);

    add_bytes_processed(Tester, DestBuffer.count);

    handle_deallocation(Params, &DestBuffer);
  }
}
static void NOPx8(RepetitionTester *Tester, ReadParameters *Params) {
  while (is_testing(Tester)) {
    buffer DestBuffer = Params->Dest;
    handle_allocation(Tester, Params, &DestBuffer);

    begin_time(Tester);
    NOPx8ASM(DestBuffer.count);
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
    {"NOPx1", NOPx1}, {"NOPx2", NOPx2}, {"NOPx3", NOPx3}, {"NOPx4", NOPx4},
    {"NOPx5", NOPx5}, {"NOPx6", NOPx6}, {"NOPx7", NOPx7}, {"NOPx8", NOPx8},
};

int main(int argc, char **argv) {

  if (argc != 2) {
    printf("Usage: %s [num_repetitions]\n", argv[0]);
    return 1;
  }

  size_t num_repetitions = atoi(argv[1]);

  RepetitionTester testers[8] = {};

  struct stat stat_res;
  stat("haversine_inp.json", &stat_res);

  ReadParameters Params = {};
  Params.Dest = allocate_buffer(stat_res.st_size, false);
  Params.FileName = "haversine_inp.json";
  Params.alloc_type = AllocType_malloc;

  for (;;) {

    for (u32 FuncIndex = 0; FuncIndex < 8; ++FuncIndex) {
      RepetitionTester *Tester = &testers[FuncIndex];
      TestFunction TestFunc = TestFunctions[FuncIndex];

      printf("\n--- %s ---\n", TestFunc.Name);
      init_tester(Tester, num_repetitions);
      TestFunc.Func(Tester, &Params);
      print_stats(Tester);
    }
  }
}
