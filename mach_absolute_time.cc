#include <cstdint>
#include <mach/mach_time.h> // For mach_absolute_time()
#include <stdio.h>

int main() {

  uint64_t i = mach_absolute_time();
  printf("%llu", i);
}
