

#include "../timing/repetition_tester.cc"
#include <cstdint>
#include <cstdio>
#include <sys/stat.h>

extern "C" void Read_x1(u64 Count, uint8_t *Data);
extern "C" void Read_x2(u64 Count, uint8_t* Data);
extern "C" void Read_x3(u64 Count, uint8_t* Data);
extern "C" void Read_x4(u64 Count, uint8_t* Data);

typedef void post_test_func(u64 Count, uint8_t *Data);

struct TestFunction {
  char const *Name;
  post_test_func *Func;
};
TestFunction TestFunctions[] = {
    {"Read_x1", Read_x1},
    {"Read_x2", Read_x2},
    {"Read_x3", Read_x3},
    {"Read_x4", Read_x4},

};

int main(int argc, char **argv) {

  if (argc != 2) {
    printf("Usage: %s [num_repetitions]\n", argv[0]);
    return 1;
  }

  size_t num_repetitions = atoi(argv[1]);

  RepetitionTester testers[5] = {};

  struct stat stat_res;
  stat("../haversine/haversine_inp.json", &stat_res);

  ReadParameters Params = {};
  Params.Dest = allocate_buffer(stat_res.st_size, false);
  Params.FileName = "../haversine/haversine_inp.json";
  Params.alloc_type = AllocType_malloc;

  buffer DestBuffer = Params.Dest;
  handle_allocation( &Params, &DestBuffer);

  for (;;) {

    for (u32 FuncIndex = 0; FuncIndex < 4; ++FuncIndex) {
      RepetitionTester *Tester = &testers[FuncIndex];
      TestFunction TestFunc = TestFunctions[FuncIndex];

      printf("\n--- %s ---\n", TestFunc.Name);
      init_tester(Tester, num_repetitions);

      while (is_testing(Tester)) {

        begin_time(Tester);
        TestFunc.Func(DestBuffer.count, DestBuffer.data);
        end_time(Tester);

        add_bytes_processed(Tester, DestBuffer.count);

      }




      print_stats(Tester);
    }
  }


  handle_deallocation(&Params, &DestBuffer);
}
