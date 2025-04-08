
#include <cstdint>
#include <stdint.h>
#include <sys/resource.h>

#include "time.cc"

struct RepetitionTester {
  uint32_t num_repetitions;
  uint32_t cur_repetitions;

  uint64_t min_time;
  uint64_t max_time;
  uint64_t avg_time;

  uint64_t bytes_processed;
  uint64_t page_faults;

  uint64_t current_start_time;
};

void init_tester(RepetitionTester *tester, u32 num_repetitions) {
  tester->cur_repetitions = 0;
  tester->min_time = INT64_MAX;
  tester->max_time = 0;
  tester->current_start_time = read_cpu_timer();
  tester->num_repetitions = num_repetitions;
  tester->bytes_processed = 0;
  tester->page_faults = 0;
}

void begin_time(RepetitionTester *tester) {
  tester->current_start_time = read_cpu_timer();
}

void end_time(RepetitionTester *tester) {

  printf("Completed RUN %d\n", tester->cur_repetitions);
  u64 end_time = read_cpu_timer();
  u64 time_taken = end_time - tester->current_start_time;

  if (time_taken < tester->min_time) {
    tester->min_time = time_taken;
  }

  if (time_taken > tester->max_time) {
    tester->max_time = time_taken;
  }

  tester->cur_repetitions += 1;
  tester->avg_time = (tester->avg_time * ((f64)(tester->cur_repetitions - 1) /
                                          tester->cur_repetitions)) +
                     (f64)(time_taken) / tester->cur_repetitions;
}

bool is_testing(RepetitionTester *tester) {
  return tester->cur_repetitions < tester->num_repetitions;
}

void print_stats(RepetitionTester *tester) {
  printf("RUN STATS:\nMAX TIME: %llu\nMIN TIME: %llu\nAVG TIME: %llu\n",
         tester->max_time, tester->min_time, tester->avg_time);

  printf("AVG BYTES PROCESSED: %.2fMb\nAVG PAGE FAULTS: %llu\n",
         (f64)tester->bytes_processed / 1024. / 1024. / tester->num_repetitions,
         tester->page_faults / tester->num_repetitions);
}

void count_page_faults(RepetitionTester *tester) {
  struct rusage rusage_res;
  int success = getrusage(RUSAGE_SELF, &rusage_res);
  printf("page fault read res %ld\n", rusage_res.ru_minflt);

  tester->page_faults = rusage_res.ru_minflt;
}

void add_bytes_processed(RepetitionTester *tester, u64 byte_count) {
  tester->bytes_processed += byte_count;
}
