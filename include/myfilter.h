#ifndef __MY_FILTER_H__
#define __MY_FILTER_H__

#include <QVideoFilterRunnable>
#include <QVideoFrame>
#include <QVideoSurfaceFormat>

class MyFilter : public QVideoFilterRunnable {
public:
	MyFilter(QAbstractVideoFilter *parent=nullptr);
	
	void setFormat(int format) { mFormat = format; }
protected:
	QVideoFrame run(QVideoFrame *, const QVideoSurfaceFormat &, RunFlags) override; 

private:
	QAbstractVideoFilter *mFilter;
    int mFormat{0};
};



#endif
