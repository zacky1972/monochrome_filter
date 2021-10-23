#include "monochrome16.h"
#include <stdint.h>

#if ! (defined(__arm64__) || defined(__aarch64__))
void monochrome16(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint8_t *pin = in;
    uint8_t *pout = out;
    for(uint64_t i = 0; i < size; i++) {
        uint8_t r = *pin++;
        uint8_t g = *pin++;
        uint8_t b = *pin++;
        uint8_t m = r * 0.299f + g * 0.587f + b * 0.114f;
        *pout++ = m;
        *pout++ = m;
        *pout++ = m;
    }
}
#else // (defined(__arm64__) || defined(__aarch64__))

static const __fp16 mono_r = 0.299;
static const __fp16 mono_g = 0.587;
static const __fp16 mono_b = 0.114;

void monochrome16(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint8_t *pin = in;
    uint8_t *pout = out;
    for(uint64_t i = 0; i < size; i++) {
        uint8_t r = *pin++;
        uint8_t g = *pin++;
        uint8_t b = *pin++;
        uint8_t m = (__fp16)r * mono_r + (__fp16)g * mono_g + (__fp16)b * mono_b;
        *pout++ = m;
        *pout++ = m;
        *pout++ = m;
    }
}
#endif
