#ifndef __COLOR_UTIL_H__
#define __COLOR_UTIL_H__

#include <QVector>
#include <QMap>

#include <opencv2/imgproc.hpp>


QVector<int> idx2bgr({
	cv::COLOR_BGR2BGRA, cv::COLOR_BGR2RGBA, cv::COLOR_BGR2RGB,
       	cv::COLOR_BGR2GRAY, cv::COLOR_BGR2BGR565, cv::COLOR_BGR2BGR555, 
	cv::COLOR_BGR2XYZ, cv::COLOR_BGR2YCrCb, cv::COLOR_BGR2HSV, 
	cv::COLOR_BGR2Lab, cv::COLOR_BGR2Luv, cv::COLOR_BGR2HLS, 
	cv::COLOR_BGR2HSV_FULL, cv::COLOR_BGR2HLS_FULL,
       	cv::COLOR_BGR2YUV, cv::COLOR_BGR2YUV_I420,
       	cv::COLOR_BGR2YUV_IYUV, cv::COLOR_BGR2YUV_YV12
});


#endif
