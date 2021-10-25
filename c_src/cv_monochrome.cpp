#include <stdint.h>
#include <math.h>
#include <string.h>
#include <opencv2/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

#ifdef EXIST_CUDA
#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>
#endif

#include "cv_monochrome.h"

extern "C" void cv_monochrome(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint64_t x = (uint64_t)sqrt(size);
    cv::Mat inMat = cv::Mat(x, x, CV_8UC3, in);
    cv::Mat outMat;
    cv::cvtColor(inMat, outMat, cv::COLOR_RGB2GRAY);
    memcpy(out, outMat.ptr(), size);
}

extern "C" void cv_monochrome_gpu(uint64_t size, uint8_t *in, uint8_t *out)
{
    uint64_t x = (uint64_t)sqrt(size);
    cv::Mat inMat = cv::Mat(x, x, CV_8UC3, in);
    cv::Mat outMat = cv::Mat(x, x, CV_8UC3);
#ifndef EXIST_CUDA
    cv::cvtColor(inMat, outMat, cv::COLOR_RGB2GRAY);
#else // define(EXIST_CUDA)
    cv::cuda::GpuMat inMatG, outMatG;
    inMat.upload(inMatG);
    cv::cuda::cvtColor(inMatG, outMatG, cv::COLOR_RGB2GRAY);
    outMat.download(outMatG);
#endif
    memcpy(out, outMat.ptr(), size);
}
