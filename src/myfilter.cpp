#include "myfilter.h"
#include "filter.h"
#include "QVideoFrameToQImage.h"
#include <QDebug>
#include <QMessageBox>
#include "cvutil.h"
#include <QPainter>
#include <QPaintDevice>
#include <QPaintEngine>
#include <QBrush>
#include <QMessageBox>
#include <QWidget>


MyFilter::MyFilter(QAbstractVideoFilter *filter)
	: mFilter(filter)
{
}



QVideoFrame MyFilter::run(QVideoFrame *vframe, const QVideoSurfaceFormat &vformat, RunFlags vflags) {
	if (not vframe->isValid())
		return *vframe;
	vframe->map(QAbstractVideoBuffer::ReadOnly);

	Mat mat(vframe->height(), vframe->width(), CV_8UC4, vframe->bits(), vframe->bytesPerLine());
	Mat mat2;

	Filter *f = static_cast<Filter*>(mFilter);
	cvtColor(mat, mat2, cv::COLOR_RGBA2BGR);

	int hmin, hmax, smin, smax, vmin, vmax, 
	    ctyp, styp, erox, eroy, dilx, dily;
	hmin = f->getHMin();
	hmax = f->getHMax();
	smin = f->getSMin();
	smax = f->getSMax();
	vmin = f->getVMin();
	vmax = f->getVMax();
	ctyp = f->getColorType();
	styp = f->getShowType();
	erox = f->getErodeX();
	eroy = f->getErodeY();
	dilx = f->getDilateX();
	dily = f->getDilateY();

	Scalar min(hmin, smin, vmin);
	Scalar max(hmax, smax, vmax);

	switch (styp) {
		case 0: {
			mat = mat2;
			break;
		}
		case 1: {
			if (ctyp == cv::COLOR_BGR2BGR555
			|| ctyp == cv::COLOR_BGR2BGR565)
				ctyp=0;
			cvtColor (mat2, mat, ctyp);
			break;
		}
		case 2: {
			mat = getMask(mat2, min, max, ctyp);
			break;
		}
		case 3: {
			Mat erok, dilk;
			erok = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(erox, eroy));
			dilk = cv::getStructuringElement(cv::MORPH_RECT, cv::Size(dilx, dily));
			mat = getMask(mat2, min, max, ctyp);
			cv::Canny (mat, mat2, 50, 150);
			cv::erode(mat2, mat, erok);
			cv::dilate(mat, mat2, dilk);
			mat = mat2;
			break;
		}	
	}

	cvtColor(mat, mat2, cv::COLOR_BGR2RGBA);

	QImage img(mat2.data, mat2.cols, mat2.rows, mat2.step, QImage::Format_RGBX8888);
	QImage img2 = img.mirrored().convertToFormat(QImage::Format_RGB32);
	QVideoSurfaceFormat format(img2.size(), QVideoFrame::pixelFormatFromImageFormat(img2.format()));
	f->setNewFrame(QVideoFrame(img2), format);
	vframe->unmap();
	
	return *vframe;
}
