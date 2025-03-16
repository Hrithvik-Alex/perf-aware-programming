#include <iostream>
#include <random>
#include <fstream>
#include <math.h>

typedef double f64;
#include "../computer_enhance/perfaware/part2/listing_0065_haversine_formula.cpp"

using namespace std;

enum class GenerationMethod
{
    UNIFORM,
    CLUSTER,
};

GenerationMethod parseMethod(const char *methodName)
{
    if (strcmp(methodName, "uniform") == 0)
    {
        return GenerationMethod::UNIFORM;
    }
    else if (strcmp(methodName, "cluster") == 0)
    {
        return GenerationMethod::CLUSTER;
    }
    fprintf(stderr, "WARNING: Unrecognized method name. Using 'uniform'.\n");

    return GenerationMethod::UNIFORM;
}

typedef struct Coord
{
    double x;
    double y;
} Coord;

Coord get_random_xy_pair(mt19937 &gen, GenerationMethod method)
{
    if (method == GenerationMethod::UNIFORM)
    {
        static uniform_real_distribution<double> x_range(-180.0, 180.0);
        static uniform_real_distribution<double> y_range(-90.0, 90.0);

        return {x_range(gen), y_range(gen)};
    }
    else
    {
        static uniform_real_distribution<double> distributions[8][2];
        static bool is_initialized = false;
        if (!is_initialized)
        {
            for (int i = 0; i < 8; ++i)
            {
                double x_stride = (90.0 * (double)(i % 4));
                double y_stride = (90.0 * (double)(i % 2));
                distributions[i][0] = uniform_real_distribution<double>(-180.0 + x_stride, -90.0 + x_stride);
                distributions[i][1] = uniform_real_distribution<double>(-90.0 + y_stride, 0.0 + y_stride);
            }
            is_initialized = true;
        }
        static uniform_int_distribution<size_t> cluster(0, 7);

        size_t index = cluster(gen);
        return {distributions[index][0](gen), distributions[index][1](gen)};
    }
}

int main(int argc, char **argv)
{

    if (argc != 4)
    {
        fprintf(stderr, "Usage: %s [uniform/cluster] [random seed] [number of coordinate pairs]\n", argv[0]);
        return 1;
    }

    const char *methodName = argv[1];
    GenerationMethod method = parseMethod(methodName);

    long seed = atol(argv[2]);
    long pairCount = atol(argv[3]);
    if (pairCount <= 0)
    {
        fprintf(stderr, "Error: amount_of_pairs must be a positive number\n");
        exit(1);
    }

    ofstream outFile("haversine_inp.json");
    outFile.precision(17);

    mt19937 gen(seed);

    outFile << "{ \"pairs\": [ ";

    double average_haversine = 0.0;
    size_t current_added = 0;

    for (long i = 0; i < pairCount; i++)
    {

        Coord zero_coord = get_random_xy_pair(gen, method);
        Coord one_coord = get_random_xy_pair(gen, method);

        double result = ReferenceHaversine(zero_coord.x, zero_coord.y, one_coord.x, one_coord.y, 6372.8);

        current_added++;
        double delta = result - average_haversine;
        average_haversine += delta / current_added;

        outFile << "{\"x0\":" << zero_coord.x
                << ",\"y0\":" << zero_coord.y
                << ",\"x1\":" << one_coord.x
                << ",\"y1\":" << one_coord.y << "}";
        if (i < pairCount - 1)
            outFile << ",";
    }

    printf("Haversine Sum: %f\n", average_haversine);
    outFile << " ] }" << endl;
}