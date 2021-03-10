#ifndef __CV_UTIL_H__
#define __CV_UTIL_H__

#include <vector>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>

using std::vector;
using cv::Mat;
using cv::Point;
using cv::Scalar;
using cv::Size;

Mat getMask(Mat &, Scalar, Scalar, int ctype=cv::COLOR_BGR2HSV); 
vector<vector<Point>> getContours(Mat&, Scalar min, Scalar max);
vector<Point> getBigger(vector<vector<Point>> &);

#endif
