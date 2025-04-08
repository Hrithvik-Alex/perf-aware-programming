
#include "../timing/repetition_tester.cc"
#include <cerrno>
#include <cstdint>
#include <cstring>
#include <stdlib.h>
#include <sys/stat.h>

int main(int argc, char **argv) {

  if (argc != 2) {
    printf("Usage: %s [num_repetitions]\n", argv[0]);
    return 1;
  }

  size_t num_repetitions = atoi(argv[1]);

  static RepetitionTester tester;
  init_tester(&tester, num_repetitions);

  struct stat stat_res;
  stat("haversine_inp.json", &stat_res);

  while (is_testing(&tester)) {

    FILE *file = fopen("haversine_inp.json", "rb");

    if (file) {
      uint8_t *buffer = (uint8_t *)malloc(stat_res.st_size);
      begin_time(&tester);

      fread(buffer, stat_res.st_size, 1, file);

      end_time(&tester);

      free(buffer);
      count_page_faults(&tester);
      add_bytes_processed(&tester, stat_res.st_size);
    } else {
      printf("WE DID A BAD THING :( %s\n", strerror(errno));
    }

    fclose(file);
  }

  print_stats(&tester);
}
