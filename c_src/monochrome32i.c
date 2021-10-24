#include "monochrome32i.h"
#include <stdint.h>

#if ! (defined(__arm64__) || defined(__aarch64__))
void monochrome32i(uint64_t size, uint8_t *in, uint8_t *out)
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

#ifdef __ARM_NEON
#include <arm_neon.h>
#endif // __ARM_NEON

static float float_mono_r[] = {
    0.299,
    0.299,
    0.299,
    0.299,
};

static float float_mono_g[] = {
    0.587,
    0.587,
    0.587,
    0.587,
};

static float float_mono_b[] = {
    0.114,
    0.114,
    0.114,
    0.114,
};


void monochrome32i(uint64_t size, uint8_t *in, uint8_t *out)
{
    float32x4_t f32x4_mono_r = vld1q_f32(float_mono_r);
    float32x4_t f32x4_mono_g = vld1q_f32(float_mono_g);
    float32x4_t f32x4_mono_b = vld1q_f32(float_mono_b);

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

        uint32x4_t u32x4_pixel_r_low_low = vmovl_u16(vget_low_u16(u16x8_pixel_r_low));
        uint32x4_t u32x4_pixel_r_low_high = vmovl_high_u16(u16x8_pixel_r_low);

        uint32x4_t u32x4_pixel_g_low_low = vmovl_u16(vget_low_u16(u16x8_pixel_g_low));
        uint32x4_t u32x4_pixel_g_low_high = vmovl_high_u16(u16x8_pixel_g_low);

        float32x4_t f32x4_pixel_r_low_low = vcvtq_f32_u32(u32x4_pixel_r_low_low);
        float32x4_t f32x4_pixel_g_low_low = vcvtq_f32_u32(u32x4_pixel_g_low_low);
        float32x4_t f32x4_pixel_m_low_low = vmulq_f32(f32x4_pixel_r_low_low, f32x4_mono_r);

        uint16x8_t u16x8_pixel_b_low = vmovl_u8(vget_low_u8(u8x16_pixel_b));
        uint16x8_t u16x8_pixel_b_high = vmovl_high_u8(u8x16_pixel_b);

        f32x4_pixel_m_low_low = vmlaq_f32(f32x4_pixel_m_low_low, f32x4_pixel_g_low_low, f32x4_mono_g);

        uint32x4_t u32x4_pixel_b_low_low = vmovl_u16(vget_low_u16(u16x8_pixel_b_low));
        uint32x4_t u32x4_pixel_b_low_high = vmovl_high_u16(u16x8_pixel_b_low);
        float32x4_t f32x4_pixel_b_low_low = vcvtq_f32_u32(u32x4_pixel_b_low_low);

        f32x4_pixel_m_low_low = vmlaq_f32(f32x4_pixel_m_low_low, f32x4_pixel_b_low_low, f32x4_mono_b);

        float32x4_t f32x4_pixel_r_low_high = vcvtq_f32_u32(u32x4_pixel_r_low_high);
        float32x4_t f32x4_pixel_g_low_high = vcvtq_f32_u32(u32x4_pixel_g_low_high);
        float32x4_t f32x4_pixel_m_low_high = vmulq_f32(f32x4_pixel_r_low_high, f32x4_mono_r);

        f32x4_pixel_m_low_high = vmlaq_f32(f32x4_pixel_m_low_high, f32x4_pixel_g_low_high, f32x4_mono_g);
        float32x4_t f32x4_pixel_b_low_high = vcvtq_f32_u32(u32x4_pixel_b_low_high);
        f32x4_pixel_m_low_high = vmlaq_f32(f32x4_pixel_m_low_high, f32x4_pixel_b_low_high, f32x4_mono_b);

        uint16x8_t u16x8_pixel_m_low = vcombine_u16(
            vmovn_u32(vcvtnq_u32_f32(f32x4_pixel_m_low_low)),
            vmovn_u32(vcvtnq_u32_f32(f32x4_pixel_m_low_high)));

        uint32x4_t u32x4_pixel_r_high_low = vmovl_u16(vget_low_u16(u16x8_pixel_r_high));
        uint32x4_t u32x4_pixel_r_high_high = vmovl_high_u16(u16x8_pixel_r_high);

        uint32x4_t u32x4_pixel_g_high_low = vmovl_u16(vget_low_u16(u16x8_pixel_g_high));
        uint32x4_t u32x4_pixel_g_high_high = vmovl_high_u16(u16x8_pixel_g_high);

        float32x4_t f32x4_pixel_r_high_low = vcvtq_f32_u32(u32x4_pixel_r_high_low);
        float32x4_t f32x4_pixel_g_high_low = vcvtq_f32_u32(u32x4_pixel_g_high_low);
        float32x4_t f32x4_pixel_m_high_low = vmulq_f32(f32x4_pixel_r_high_low, f32x4_mono_r);

        f32x4_pixel_m_high_low = vmlaq_f32(f32x4_pixel_m_high_low, f32x4_pixel_g_high_low, f32x4_mono_g);

        uint32x4_t u32x4_pixel_b_high_low = vmovl_u16(vget_low_u16(u16x8_pixel_b_high));
        uint32x4_t u32x4_pixel_b_high_high = vmovl_high_u16(u16x8_pixel_b_high);
        float32x4_t f32x4_pixel_b_high_low = vcvtq_f32_u32(u32x4_pixel_b_high_low);

        f32x4_pixel_m_high_low = vmlaq_f32(f32x4_pixel_m_high_low, f32x4_pixel_b_high_low, f32x4_mono_b);

        float32x4_t f32x4_pixel_r_high_high = vcvtq_f32_u32(u32x4_pixel_r_high_high);
        float32x4_t f32x4_pixel_g_high_high = vcvtq_f32_u32(u32x4_pixel_g_high_high);
        float32x4_t f32x4_pixel_m_high_high = vmulq_f32(f32x4_pixel_r_high_high, f32x4_mono_r);

        f32x4_pixel_m_high_high = vmlaq_f32(f32x4_pixel_m_high_high, f32x4_pixel_g_high_high, f32x4_mono_g);
        float32x4_t f32x4_pixel_b_high_high = vcvtq_f32_u32(u32x4_pixel_b_high_high);
        f32x4_pixel_m_high_high = vmlaq_f32(f32x4_pixel_m_high_high, f32x4_pixel_b_high_high, f32x4_mono_b);

        uint16x8_t u16x8_pixel_m_high = vcombine_u16(
            vmovn_u32(vcvtnq_u32_f32(f32x4_pixel_m_high_low)),
            vmovn_u32(vcvtnq_u32_f32(f32x4_pixel_m_high_high)));

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
