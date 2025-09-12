#include <algorithm>
#include <cfloat>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <math.h>
#include <string>
#include <sys/mman.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <arm_neon.h>

#define PROFILE 1


constexpr double PI = 3.14159265358979323846;

typedef double f64;
#include "../computer_enhance/perfaware/part2/listing_0065_haversine_formula.cpp"
#include "../timing/repetition_tester.cc"

using namespace std;


typedef struct Output {
  size_t num_pairs;
  long total_size;
  double (*pairs)[4];
} Output;


Output parse(const char* fileName, long total_size, size_t chunk_size) {

  TRACE_FUNC;

  string total_lines = "";
  string line;
  int fd = open(fileName, O_RDWR);
  // u8* buffer = (u8*) mmap(0, total_size, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0);
  struct buffer chunk_buffer = allocate_buffer(chunk_size, false);
  // u8* current_chunk = buffer;
  size_t j = 0;

  char current_key[1024];
  char current_num[1024];
  current_key[0] = '\0';

  bool in_pairs = false;
  bool done = false;

  double (*input_pairs)[4] = new double[total_size / 4][4];
  size_t pair_length = 0;

  
  size_t remaining_size = total_size;

  bool in_quote = false;
  bool in_num = false;
  size_t kstart;
  size_t nstart;
  while(j < total_size) {
    size_t i = 0;
    
    size_t size = min(remaining_size, chunk_size);
    {
      TRACE_BANDWIDTH("read chunk", size);
      read(fd, chunk_buffer.data, size);
      // memcpy(chunk_buffer.data, current_chunk, size);
    }


    // current_chunk += chunk_size;
    remaining_size -= size;
    while (i < size) {
      TRACE_BLOCK("parse_while");
      if (done)
        break;

      switch (chunk_buffer.data[i]) {

      case '[': {
        if (strcmp(current_key, "pairs") == 0) {
          in_pairs = true;
        }
        break;
      }
      case ']': // currently once we exit the array, all the information has been
                // gathered.
      {
        done = true;
        break;
      }
      case '{': {
        if (in_pairs) {
          pair_length += 1;
        }

        break;
      }
      case '"': // resolve key
      {
       // TRACE_BLOCK("key resolve");
        if (in_quote == true) {
          in_quote = false;
          current_key[j + i -kstart] = '\0';
        } else {
          in_quote = true;
          kstart = i + j + 1;
        }

        break;
      }

      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
      case '-':
      case '.': {
       // TRACE_BLOCK("number");
        if (in_quote) {
          current_key[j + i - kstart] = chunk_buffer.data[i];
            break;
          }
        

        if (in_num == false) {
          nstart = i + j;
            in_num = true;
        }
        current_num[i + j - nstart] = chunk_buffer.data[i];

        break;
      }
      case ' ':
      case '\n':
      case '\r':
      case '}':
      case ':':
      default: {
        if(in_quote) {
          current_key[j + i - kstart] = chunk_buffer.data[i];
        }

        if(in_num) {
          in_num = false;

          current_num[j + i - nstart] = '\0';
          double num = atof(current_num);
          if (strcmp(current_key, "x0") == 0) {
            input_pairs[pair_length - 1][0] = num;
          } else if (strcmp(current_key, "y0") == 0) {
            input_pairs[pair_length - 1][1] = num;
          } else if (strcmp(current_key, "x1") == 0) {
            input_pairs[pair_length - 1][2] = num;
          } else if (strcmp(current_key, "y1") == 0) {
            input_pairs[pair_length - 1][3] = num;
          }
        }
        break;
      }
      }
      i += 1;
    }

    j += size;
  }

  // munmap(buffer, total_size);
  close(fd);
  return {pair_length, total_size, input_pairs};
}


enum Math_funcs {
  SIN,
  COS,
  ASIN,
  SQRT
};

typedef struct RangeCheck {
  Math_funcs func;
  f64 min;
  f64 max;
  f64 max_error_from_ref;
  f64 max_error_val;
} RangeCheck;

RangeCheck init(Math_funcs func) {
  return RangeCheck {
    func, DBL_MAX, DBL_MIN, DBL_MIN
  };
}

RangeCheck Sin, Cos, Asin, Sqrt;

f64 fit_x2(f64 v) {
  // from fitting from 0 to pi/2
  f64 a = -0.335749;
  f64 b =  1.16401;
   

  return a*v*v + v*b;
}
 
f64 fact(u64 x) {
  f64 res = (f64)x;
  while ( x> 1 ){
    res *= --x;
  }
  return res;
}

// inline f64 TaylorSineHorner(u32 MaxPower, f64 X)
// {
//     f64 Result = 0;
//
//     f64 X2 = X*X;
//     for(u32 InvPower = 1; InvPower <= MaxPower; InvPower += 2)
//     {
//         u32 Power = MaxPower - (InvPower - 1);
//         Result = Result*X2 + TaylorSineCoefficient(Power);
//     }
//     Result *= X;
//     
//     return Result;
// }

f64 fit_taylor_horner(size_t order, f64 x) {

  float64x1_t vy = vdup_n_f64(0.0);
  float64x1_t x_2 = vdup_n_f64(x * x);
  u64 real_order = ((order - 1)/2)*2 + 1;

  for(int i = 1; i <= real_order; i+=2) {
    int pow = real_order - (i - 1);
    f64 sign = ((pow - 1)/2 % 2) ? -1.0 : 1.0;
    f64 coeff = sign / fact(pow); 
    vy = vfma_f64(vdup_n_f64(coeff), vy, x_2);
  }

  f64 y = vget_lane_f64(vy, 0);
  y *= x;

  return y;
}


f64 fit_taylor_zero(size_t order, f64 x) {
  f64 y = x;
  f64 cur_x = x;
  f64 cur_den = 1;
  f64 sign = 1.0;
  for(int i = 3; i < order; i+=2) {
    cur_x *= x * x;
    cur_den *= i * (i - 1);
    sign *= -1.0;
    
    y += sign * cur_x / cur_den;
  }

  return y;
}

f64 csin(f64 v) {

  f64 res;
  if (fabs(v) > PI/2) {
    res = fit_taylor_horner(50, PI/2 - (fabs(v) - PI/2));
  } else {
    res = fit_taylor_horner(50, fabs(v));
  }

  if (v < 0) {
    res *= -1;
  }
  
  return res;
}

f64 ccos(f64 v) {
  return csin(v + PI/2);
}

f64 casin(f64 v) {

  return v;
}

f64 csqrt(f64 v) {
  float64x1_t vs = vdup_n_f64(v);
  float64x1_t vsqrt = vsqrt_f64(vs);
  return vget_lane_f64(vsqrt, 0);
}

f64 func_eval(f64 val, Math_funcs func) {
  switch (func) {
    case SIN:
    return sin(val);
    case COS:
    return cos(val);
    case ASIN:
  return asin(val);
    case SQRT:
  return sqrt(val);
  
  }

}
f64 cfunc_eval(f64 val, Math_funcs func) {
  switch (func) {
    case SIN:
    return csin(val);
    case COS:
    return ccos(val);
    case ASIN:
  return casin(val);
    case SQRT:
  return csqrt(val);
  
  }

}

f64 calc(f64 val, RangeCheck& check) {
  check.min = min(val, check.min);
  check.max = max(val, check.max);

  f64 rval = func_eval(val, check.func);
  f64 cval = cfunc_eval(val, check.func);

  if (check.max_error_from_ref < fabs(rval - cval)) {
    check.max_error_from_ref = fabs(rval - cval);
    check.max_error_val = val;
  }

    return cval;

}


static bool ApproxAreEqual(f64 A, f64 B)
{
    /* NOTE(casey): Epsilon can be set to whatever tolerance we decide we will accept. If we make this value larger,
       we have more options for optimization. If we make it smaller, we must more closely follow the sequence
       of floating point operations that produced the original value. At zero, we would have to reproduce the
       sequence _exactly_. */
    f64 Epsilon = 0.00000001f;
    
    f64 Diff = (A - B);
    bool Result = (Diff > -Epsilon) && (Diff < Epsilon);
    return Result;
}


static f64 our_haversine(f64 X0, f64 Y0, f64 X1, f64 Y1, f64 EarthRadius) {

  f64 lat1 = Y0;
  f64 lat2 = Y1;
  f64 lon1 = X0;
  f64 lon2 = X1;

  f64 dLat = RadiansFromDegrees(lat2 - lat1);
  f64 dLon = RadiansFromDegrees(lon2 - lon1);
  lat1 = RadiansFromDegrees(lat1);
  lat2 = RadiansFromDegrees(lat2);
  
  f64 a =
      Square(calc(dLat / 2.0, Sin)) + calc(lat1, Cos) * calc(lat2, Cos) * Square(calc(dLon / 2, Sin));
  f64 c = 2.0 * calc(calc(a, Sqrt), Asin);

  f64 Result = EarthRadius * c;

  return Result;
}



f64 compute_average(Output *output, buffer answers) {
  TRACE_FUNC;

  double average_haversine = 0.0;
  size_t current_added = 0;

  for (int i = 0; i < output->num_pairs; ++i) {
    TRACE_BLOCK("loop");
    double result =
        our_haversine(output->pairs[i][0], output->pairs[i][1],
                           output->pairs[i][2], output->pairs[i][3], 6372.8);


    ((f64*)answers.data)[i] = result;
    current_added++;
    double delta = result - average_haversine;
    average_haversine += delta / current_added;
  }

  return average_haversine;
}


typedef struct Verification {
  f64 sum;
  size_t num_errors;
} Verification;

Verification compute_reference_average(Output *output, buffer answers) {

  double average_haversine = 0.0;
  size_t current_added = 0;

  size_t num_errors = 0;

  for (int i = 0; i < output->num_pairs; ++i) {
    TRACE_BLOCK("loop");
    double result =
        ReferenceHaversine(output->pairs[i][0], output->pairs[i][1],
                           output->pairs[i][2], output->pairs[i][3], 6372.8);


    if(!ApproxAreEqual(((f64*)answers.data)[i] , result)) {
      num_errors++;
    }
    current_added++;
    double delta = result - average_haversine;
    average_haversine += delta / current_added;
  }

  return Verification{average_haversine, num_errors};
}



// size_t chunk_sizes[] = {
//   0x200,
//   0x1000,
//   0x10000,
//   0x100000,
//   0x1000000,
//   0x4000000,
//   0x10000000,
//   0x40000000
// };

size_t chunk_size = 0x100000;

int main(int argc, char **argv) {
  if (argc != 2) {
    fprintf(stderr, "Usage: %s [filename]\n", argv[0]);
    return 1;
  }

  const char *fileName = argv[1];
  ifstream file(fileName);

  file.seekg(0, file.end);
  long total_size = file.tellg();
  file.seekg(0, file.beg);



 Sin = init(SIN);
 Cos = init(COS);
 Asin = init(ASIN);
 Sqrt = init(SQRT);

  printf("Input Size: %ld\n", total_size);
  printf("Chunk size: %ld\n", chunk_size);

  begin_profile();


  Output output = parse(fileName, total_size, chunk_size);

  printf("Pair count: %lu\n", output.num_pairs);

  buffer answers = allocate_buffer(sizeof(f64) * output.num_pairs, false);
  f64 average_haversine = compute_average(&output, answers);

  // u64 total_elapsed = t2 - t0;
  // u64 parse_time = t1 - t0;
  // u64 compute_tume = t2 - t1;
  //
  // printf("TOTAL TIME: %llu; PARSE_TIME: %llu; COMPUTE_TIME: %llu\n",
  //        total_elapsed, parse_time, compute_tume);
  //
  // printf("PERCENT PARSED %f; PERCENT COMPUTE: %f\n",
  //        (f64)(t1 - t0) / (f64)total_elapsed,
  //        (f64)(t2 - t1) / (f64)total_elapsed);
  //


  
  end_profile();
  
  Verification verification_result = compute_reference_average(&output, answers);


  printf("RANGE OF OUTPUTS:\n  SIN:(%f,%f)\n  COS: (%f,%f)\n  ASIN: (%f,%f)\n  SQRT: (%f,%f)\n", Sin.min, Sin.max, Cos.min, Cos.max, Asin.min, Asin.max, Sqrt.min, Sqrt.max);
  printf("Haversine Sum: OURS: %.17g, REF: %.17g, EQUAL? %d\n", average_haversine, verification_result.sum, ApproxAreEqual(average_haversine, verification_result.sum));
  printf("NUM ERRORS IN REF CALC: %lu\n", verification_result.num_errors);

  printf("MAX REF ERRORS:\n  SIN: %f - from %f\n  COS: %f - from %f\n  ASIN: %f - from %f\n  SQRT: %f - from %f\n", Sin.max_error_from_ref, Sin.max_error_val, Cos.max_error_from_ref, Cos.max_error_val, Asin.max_error_from_ref, Asin.max_error_val, Sqrt.max_error_from_ref, Sqrt.max_error_val);
  
  delete[] output.pairs;
}


