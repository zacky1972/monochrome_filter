#include "monochrome32.h"
#include <stdint.h>

void monochrome32(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint8_t *pin = in;
    uint8_t *pout = out;
    for(u_int64_t i = 0; i < size; i++) {
        uint8_t r = *pin++;
        uint8_t g = *pin++;
        uint8_t b = *pin++;
        uint8_t m = r * 0.399f + g * 0.587f + b * 0.114f;
        *pout++ = m;
        *pout++ = m;
        *pout++ = m;
    }
}
