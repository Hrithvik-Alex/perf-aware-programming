#include "../timing/repetition_tester.cc"
#include <cstdlib>
#include <sys/stat.h>
#include <array>

extern "C" void Cache_bandwith_test(u64 Count, u64 mask, uint8_t *Data);


u64 BandwithTests[] = {
  // 0x1ff,
  // 0xfff,
  // 0x3fff, 
  // 0xffff, 
  0x3ffff,
  0xfffff,
  0x3fffff,
  0xffffff,
  0x3ffffff,
  0xfffffff,
  0x3fffffff,
  0xffffffff,
};

int main(int argc, char **argv) {

  if (argc != 2) {
    printf("Usage: %s [num_repetitions]\n", argv[0]);
    return 1;
  }

  size_t num_repetitions = atoi(argv[1]);
  constexpr size_t test_len = sizeof(BandwithTests) / sizeof(BandwithTests[0]);

  std::array<RepetitionTester, test_len> testers = {};

  u64 count = 1024 * 1024 * 1024;
  u8* buffer = (u8*)aligned_alloc(64, count);

  for (;;) {

    for (u32 TestIndex = 0; TestIndex < test_len; ++TestIndex) {
      RepetitionTester *Tester = &testers[TestIndex];
      u64 Bandwith = BandwithTests[TestIndex];

      printf("\n--- %llu MASK ---\n", Bandwith + 1);
      init_tester(Tester, num_repetitions);

      while (is_testing(Tester)) {

        begin_time(Tester);
        Cache_bandwith_test(count, Bandwith, buffer);
        end_time(Tester);

        add_bytes_processed(Tester, count);

      }

      print_stats(Tester);
    }
  }

  free(buffer);

}







