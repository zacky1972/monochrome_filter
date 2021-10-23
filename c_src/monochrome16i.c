#include "monochrome16i.h"
#include <stdint.h>

#if ! defined(__arm64__) && ! defined(__aarch64__)
void monochrome16i(uint64_t size, uint8_t *in, uint8_t *out)
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
#elif defined(__aarch64__)
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
#else // defined(__arm64__)

#include <arm_neon.h>

static __fp16 fp16_mono_r[] = {
    0.299,
    0.299,
    0.299,
    0.299,
    0.299,
    0.299,
    0.299,
    0.299,
};

static __fp16 fp16_mono_g[] = {
    0.587,
    0.587,
    0.587,
    0.587,
    0.587,
    0.587,
    0.587,
    0.587,
};

static __fp16 fp16_mono_b[] = {
    0.114,
    0.114,
    0.114,
    0.114,
    0.114,
    0.114,
    0.114,
    0.114,
};


void monochrome16i(uint64_t size, uint8_t *in, uint8_t *out)
{
    float16x8_t f16x8_mono_r = vld1q_f16(fp16_mono_r);
    float16x8_t f16x8_mono_g = vld1q_f16(fp16_mono_g);
    float16x8_t f16x8_mono_b = vld1q_f16(fp16_mono_b);

    uint8_t *pin = in;
    uint8_t *pout = out;

    for(uint64_t i = 0; i < size; i += 16) {
        uint8x16x3_t v = vld3q_u8(pin);
        pin += 16 * 3;

        uint8x16_t u8x16_pixel_r = v.val[0];
        uint8x16_t u8x16_pixel_g = v.val[1];
        uint8x16_t u8x16_pixel_b = v.val[2];

        uint16x8_t u16x8_pixel_r_low = vmovl_u8(vget_low_u8(u8x16_pixel_r));
        uint16x8_t u16x8_pixel_r_high = vmovl_high_u8(u8x16_pixel_r);

        uint16x8_t u16x8_pixel_g_low = vmovl_u8(vget_low_u8(u8x16_pixel_g));
        uint16x8_t u16x8_pixel_g_high = vmovl_high_u8(u8x16_pixel_g);

        float16x8_t f16x8_pixel_r_low = vcvtq_f16_u16(u16x8_pixel_r_low);
        float16x8_t f16x8_pixel_g_low = vcvtq_f16_u16(u16x8_pixel_g_low);
        float16x8_t f16x8_pixel_m_low = vmulq_f16(f16x8_pixel_r_low, f16x8_mono_r);

        uint16x8_t u16x8_pixel_b_low = vmovl_u8(vget_low_u8(u8x16_pixel_b));
        uint16x8_t u16x8_pixel_b_high = vmovl_high_u8(u8x16_pixel_b);

        f16x8_pixel_m_low = vaddq_f16(f16x8_pixel_m_low, vmulq_f16(f16x8_pixel_g_low, f16x8_mono_g));

        float16x8_t f16x8_pixel_b_low = vcvtq_f16_u16(u16x8_pixel_b_low);

        f16x8_pixel_m_low = vaddq_f16(f16x8_pixel_m_low, vmulq_f16(f16x8_pixel_b_low, f16x8_mono_b));

        uint16x8_t u16x8_pixel_m_low = vcvtnq_u16_f16(f16x8_pixel_m_low);

        float16x8_t f16x8_pixel_r_high = vcvtq_f16_u16(u16x8_pixel_r_high);
        float16x8_t f16x8_pixel_g_high = vcvtq_f16_u16(u16x8_pixel_g_high);
        float16x8_t f16x8_pixel_m_high = vmulq_f16(f16x8_pixel_r_high, f16x8_mono_r);

        f16x8_pixel_m_high = vaddq_f16(f16x8_pixel_m_high, vmulq_f16(f16x8_pixel_g_high, f16x8_mono_g));

        float16x8_t f16x8_pixel_b_high = vcvtq_f16_u16(u16x8_pixel_b_high);

        f16x8_pixel_m_high = vaddq_f16(f16x8_pixel_m_high, vmulq_f16(f16x8_pixel_b_high, f16x8_mono_b));

        uint16x8_t u16x8_pixel_m_high = vcvtnq_u16_f16(f16x8_pixel_m_high);

        uint8x16_t u8x16_pixel_m = vcombine_u8(
            vmovn_u16(u16x8_pixel_m_low),
            vmovn_u16(u16x8_pixel_m_high));

        v.val[0] = u8x16_pixel_m;
        v.val[1] = u8x16_pixel_m;
        v.val[2] = u8x16_pixel_m;

        vst3q_u8(pout, v);
        pout += 16 * 3;
    }
}

#endif
