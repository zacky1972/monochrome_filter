#include <stdint.h>
#include <math.h>
#include <string.h>
#include <opencv2/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>


#include "cv_monochrome.h"

extern "C" void cv_monochrome(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint64_t x = (uint64_t)sqrt(size);
    cv::Mat inMat = cv::Mat(x, x, CV_8UC3, in);
    cv::Mat outMat = cv::Mat(x, x, CV_8UC3);
    cv::cvtColor(inMat, outMat, cv::COLOR_RGB2GRAY);
    memcpy(out, outMat.ptr(), size);
}


/*
cv::Exception: OpenCV(4.5.3) 
/tmp/opencv-20210728-67818-iouvb6/opencv-4.5.3/modules/imgproc/src/color.simd_helpers.hpp:
92: error: (-2:Unspecified error) in function 
'cv::impl::(anonymous namespace)::CvtHelper<cv::impl::(anonymous namespace)::Set<3, 4, -1>, 
cv::impl::(anonymous namespace)::Set<1, -1, -1>, 
cv::impl::(anonymous namespace)::Set<0, 2, 5>, 
cv::impl::(anonymous namespace)::NONE>::CvtHelper(cv::InputArray, cv::OutputArray, int) 
[VScn = cv::impl::(anonymous namespace)::Set<3, 4, -1>, VDcn = cv::impl::(anonymous namespace)::Set<1, -1, -1>, VDepth = cv::impl::(anonymous namespace)::Set<0, 2, 5>, sizePolicy = cv::impl::(anonymous namespace)::NONE]'
*/