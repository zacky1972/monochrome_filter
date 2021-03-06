#ifndef CV_MONOCHROME_H
#define CV_MONOCHROME_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus

void cv_monochrome(uint64_t size, uint8_t *in, uint8_t *out);
void cv_monochrome_gpu(uint64_t size, uint8_t *in, uint8_t *out);

#ifdef __cplusplus
}
#endif // __cplusplus

#endif // CV_MONOCHROME_H