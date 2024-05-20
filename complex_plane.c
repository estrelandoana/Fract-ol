#include <stdio.h>

typedef struct  s_complex
{
    double real;
    double imag;
}              t_complex;

int main()
{
    t_complex z;
    t_complex c;

    z.real = 0;
    z.imag = 0;

    c.real = 5;
    c.imag = 2;

    for (int i = 0; i < 42; ++i)
    {
        tmp_real = (z.real * z.real) - (z.imag * z.imag);
        z.imag = 2 * z.real * z.imag;
        z.real = tmp_real;
        z.real += c.real;
        z.imag += c.imag;

        printf("iteration n -> %d real %f imaginary%f\n", i, z.real, z.imag);
    }
}