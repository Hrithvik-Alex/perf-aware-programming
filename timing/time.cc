#include "stdio.h"
#include <cstdint>
#include <cstdio>
#include <sys/resource.h>
#include <sys/time.h>
#include <sys/wait.h>

typedef double f64;
typedef uint64_t u64;
typedef uint32_t u32;

inline u64 read_cpu_timer(void) {
  u64 counter;
  asm volatile("mrs %0, CNTVCT_EL0" : "=r"(counter));
  return counter;
}

inline u64 get_cpu_timer_frequency(void) {
  u64 frequency;
  asm volatile("mrs %0, CNTFRQ_EL0" : "=r"(frequency));
  return frequency;
}

static u64 get_os_timer_frequency(void) { return 1000000; }

inline u64 read_os_timer(void) {

  timeval value;
  gettimeofday(&value, 0);

  u64 result =
      get_os_timer_frequency() * (u64)value.tv_sec + (u64)value.tv_usec;
  return result;
}

static u64 estimate_cpu_frequency(u64 wait_millis) {
  {

    u64 os_freq = get_os_timer_frequency();
    // printf("    OS Freq: %.16f\n", os_freq);
    u64 t0 = read_cpu_timer();
    u64 os_start = read_os_timer();
    u64 os_end = 0;
    u64 os_elapsed = 0;
    u64 os_wait_time = os_freq * wait_millis / 1000;
    while (os_elapsed < os_wait_time) {
      os_end = read_os_timer();
      os_elapsed = os_end - os_start;
    }

    u64 t1 = read_cpu_timer();
    u64 elapsed = t1 - t0;

    u64 cpu_freq = os_freq * elapsed / os_elapsed;

    // printf("   OS Timer: %.16f -> %llu = %llu elapsed\n", os_start, os_end,
    //        os_elapsed);
    // printf(" OS Seconds: %.4f\n", (f64)os_elapsed / (f64)os_freq);
    // printf("  CPU Timer: %.16f -> %llu = %llu elapsed\n", t0, t1, elapsed);
    //
    // printf("   CPU Freq: %.16f (guessed)\n", cpu_freq);

    return cpu_freq;
  }
}

#ifndef PROFILE
#define PROFILE 1
#endif

#if PROFILE

struct TimeInfo {
  u64 elapsed_wo_child;
  u64 elapsed_total;
  u64 hits;
  u64 byte_count;
  const char *label;
};

#define TIMING_ARRAY_SIZE 4096

struct Profiler {

  TimeInfo timings[TIMING_ARRAY_SIZE];
  u64 start_time;
  u64 end_time;
};

static Profiler PROFILER;

static u32 global_parent_index;

struct TraceBlock {
  u64 t0;
  const char *block_name;
  u32 index;
  u32 parent_index;
  u64 elapsed_time_prev;

  TraceBlock(const char *name, u32 index, u64 byte_count)
      : block_name(name), index(index), parent_index(global_parent_index) {
    t0 = read_cpu_timer();
    global_parent_index = index;
    elapsed_time_prev = PROFILER.timings[index].elapsed_total;
    PROFILER.timings[index].byte_count = byte_count;
  }

  ~TraceBlock() {
    u64 t1 = read_cpu_timer();

    TimeInfo *time_info = &PROFILER.timings[index];
    TimeInfo *parent_time_info = &PROFILER.timings[parent_index];
    time_info->elapsed_wo_child += t1 - t0;
    parent_time_info->elapsed_wo_child -= t1 - t0;
    time_info->elapsed_total = elapsed_time_prev + t1 - t0;
    time_info->hits++;
    time_info->label = block_name;

    global_parent_index = parent_index;
    // u64 freq = get_cpu_timer_frequency();
    // printf("%s took %.16f seconds\n", block_name, (f64)(t1 - t0) / freq);
  }
};

#define CONCAT(A, B) A##B
#define TRACE_BANDWIDTH(name, byte_count)                                      \
  TraceBlock CONCAT(Block, __LINE__)(name, __COUNTER__ + 1, byte_count);
#define TRACE_BLOCK(name) TRACE_BANDWIDTH(name, 0)
#define TRACE_FUNC TRACE_BLOCK(__func__)

#define PRINT_TIMINGS(total_elapsed, freq)                                     \
  {                                                                            \
    for (u32 i = 0; i < TIMING_ARRAY_SIZE; ++i) {                              \
      TimeInfo *info = &PROFILER.timings[i];                                   \
      if (info->elapsed_total) {                                               \
        printf("%s[%llu]: %llu (%.2f%%", info->label, info->hits,              \
               info->elapsed_wo_child,                                         \
               100 * ((f64)info->elapsed_wo_child / (f64)total_elapsed));      \
        if (info->elapsed_total != info->elapsed_wo_child) {                   \
          printf(", %.2f%% w/children",                                        \
                 100 * ((f64)info->elapsed_total / (f64)total_elapsed));       \
        }                                                                      \
                                                                               \
        printf(")");                                                           \
        if (info->byte_count) {                                                \
          f64 megabytes = 1024. * 1024.;                                       \
          f64 gigabytes = 1024. * 1024. * 1024.;                               \
          printf("processed %.2fmbs in %.2fGbps",                              \
                 (f64)info->byte_count / megabytes,                            \
                 (f64)info->byte_count / gigabytes /                           \
                     ((f64)info->elapsed_total / freq));                       \
        }                                                                      \
        printf("\n");                                                          \
      }                                                                        \
    }                                                                          \
  }

#else

struct Profiler {

  u64 start_time;
  u64 end_time;
};

static Profiler PROFILER;

#define TRACE_BANDWIDTH(...)
#define TRACE_BLOCK(...)
#define PRINT_TIMINGS(...)
#define TRACE_FUNC

#endif

static void begin_profile() { PROFILER.start_time = read_cpu_timer(); }

static void end_profile() {
  PROFILER.end_time = read_cpu_timer();
  u64 freq = get_cpu_timer_frequency();

  u64 total_elapsed = PROFILER.end_time - PROFILER.start_time;
  printf("Total Time Elapsed: %0.4fs (CPU COUNTER freq %llu)\n",
         (f64)total_elapsed / (f64)freq, freq);

  PRINT_TIMINGS(total_elapsed, freq);
}
//
// u64 __COUNTER_START__;
// u64 __CPU_FREQ__ = get_cpu_timer_frequency();
//
// #define START_TIME __COUNTER_START__ = read_cpu_timer();
//
// #define END_TIME \
//   { \
//     u64 __COUNTER_END__ = read_cpu_timer(); \
//     printf("timing ending at line %d took %.16f seconds\n", __LINE__, \
//            (f64)(__COUNTER_END__ - __COUNTER_START__) / __CPU_FREQ__); \
//   }
//
// int main(int argc, char **argv) { estimate_cpu_frequency(1000); }
