#include "cvutil.h"



Mat getMask(Mat &mat, Scalar min, Scalar max, int ctype) {
	Mat ret, hsv;
	cv::cvtColor(mat, hsv, ctype);	
	cv::inRange(hsv, min, max, ret);	
	return ret;
}


vector<vector<Point>> getContours(Mat &mat, Scalar min, Scalar max) {
	vector<vector<Point>> ret;
	vector<cv::Vec4i> hierarchy;
	Mat canny, mask, kernel;
	mask = getMask(mat, min, max);
    	kernel = cv::getStructuringElement(cv::MORPH_RECT, Size(3, 3));
    	cv::Canny(mask, canny, 50, 75);

    	cv::findContours(canny, ret, hierarchy, cv::RETR_EXTERNAL, cv::CHAIN_APPROX_SIMPLE);
	
	return ret;
}


vector<Point> getBigger(vector<vector<Point>> &points) {
	int best=0, sz;
	vector<Point> ret;
	for (vector<Point> point : points) {
		sz = point.size();
		if (sz > best) {
			best = sz;
			ret = point;
		}	
	}
	return ret;
}
