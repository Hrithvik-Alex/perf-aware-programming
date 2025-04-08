

#include <cstdio>
#include <cstdlib>
#include <sys/mman.h>
#include <sys/resource.h>

typedef unsigned long long u64;
typedef unsigned char u8;

int main(int argc, char **argv) {
  u64 page_size = 4096 * 4;

  if (argc != 2) {
    printf("Usage: %s [num_pages]\n", argv[0]);
    return 1;
  }

  u64 pages = atol(argv[1]);

  printf("Page Count, Touch Count, Fault Count, Fault Extra\n");

  struct rusage rusage_res;

  for (u64 i = 0; i < pages; ++i) {
    u64 cur_size = i * page_size;
    u8 *bytes = (u8 *)mmap(0, cur_size, PROT_WRITE | PROT_READ,
                           MAP_ANON | MAP_PRIVATE, -1, 0);

    if (bytes) {
      getrusage(RUSAGE_SELF, &rusage_res);
      u64 start_fault = rusage_res.ru_minflt;

      for (u64 j = 0; j < cur_size; ++j) {
        bytes[j] = (u8)j;
      }

      getrusage(RUSAGE_SELF, &rusage_res);
      u64 end_fault = rusage_res.ru_minflt;

      printf("%llu, %llu, %llu, %lld\n", pages, i, end_fault - start_fault,
             (end_fault - start_fault - i));

      munmap(bytes, cur_size);
    }
  }
}
