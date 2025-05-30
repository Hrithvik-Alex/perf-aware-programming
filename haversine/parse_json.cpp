#include <fstream>
#include <math.h>
#include <string>

#define PROFILE 1

typedef double f64;
#include "../computer_enhance/perfaware/part2/listing_0065_haversine_formula.cpp"
#include "../timing/time.cc"

using namespace std;

typedef struct Output {
  size_t num_pairs;
  long total_size;
  double (*pairs)[4];
} Output;

Output parse(ifstream &json_file) {

  TRACE_FUNC;

  string total_lines = "";
  string line;

  json_file.seekg(0, json_file.end);
  long total_size = json_file.tellg();
  json_file.seekg(0, json_file.beg);

  char *buffer = new char[total_size];

  {
    TRACE_BANDWIDTH("read file", total_size);
    json_file.read(buffer, total_size);
  }
  json_file.close();

  size_t i = 0;
  int depth = 0;

  char current_key[1024];
  int key_len = -1;
  current_key[0] = '\0';

  bool in_pairs = false;
  bool done = false;

  double (*input_pairs)[4] = new double[total_size / 4][4];
  size_t pair_length = 0;
  while (i < total_size) {
    TRACE_BLOCK("parse_while");
    if (done)
      break;
    switch (buffer[i]) {

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
      TRACE_BLOCK("key resolve");
      int kstart = i + 1;
      i += 1;
      while (buffer[i] != '"') {
        i += 1;
      }
      memcpy(current_key, buffer + kstart, i - kstart);
      key_len = i - kstart;
      current_key[key_len] = '\0';

      i += 1; // skip :

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
    case '-': {
      TRACE_BLOCK("number");
      int nstart = i;
      while ((buffer[i] - '0' >= 0 && buffer[i] - '0' <= 9) ||
             buffer[i] == '.' || buffer[i] == '-') {
        i += 1;
      }

      char saved = buffer[i];
      buffer[i] = '\0';
      double num = atof(buffer + nstart);
      buffer[i] = saved;

      if (strcmp(current_key, "x0") == 0) {
        input_pairs[pair_length - 1][0] = num;
      } else if (strcmp(current_key, "y0") == 0) {
        input_pairs[pair_length - 1][1] = num;
      } else if (strcmp(current_key, "x1") == 0) {
        input_pairs[pair_length - 1][2] = num;
      } else if (strcmp(current_key, "y1") == 0) {
        input_pairs[pair_length - 1][3] = num;
      }
      break;
    }
    case ' ':
    case '\n':
    case '\r':
    case '}':
    case ':':
    default: {
      break;
    }
    }
    i += 1;
  }

  delete[] buffer;

  return {pair_length, total_size, input_pairs};
}

f64 compute_average(Output *output) {
  TRACE_FUNC;

  double average_haversine = 0.0;
  size_t current_added = 0;

  for (int i = 0; i < output->num_pairs; ++i) {
    TRACE_BLOCK("loop");
    double result =
        ReferenceHaversine(output->pairs[i][0], output->pairs[i][1],
                           output->pairs[i][2], output->pairs[i][3], 6372.8);

    current_added++;
    double delta = result - average_haversine;
    average_haversine += delta / current_added;
  }

  return average_haversine;
}

int main(int argc, char **argv) {
  begin_profile();
  if (argc != 2) {
    fprintf(stderr, "Usage: %s [filename]\n", argv[0]);
    return 1;
  }

  const char *fileName = argv[1];
  ifstream file(fileName);
  Output output = parse(file);

  printf("Input Size: %ld\n", output.total_size);
  printf("Pair count: %lu\n", output.num_pairs);

  f64 average_haversine = compute_average(&output);

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
  printf("Haversine Sum: %.17g\n", average_haversine);
  delete output.pairs;
  end_profile();
}
