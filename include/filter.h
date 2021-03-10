#ifndef __FILTER_H__
#define __FILTER_H__

#include <QAbstractVideoFilter>
#include <QVideoFilterRunnable>
#include <QAbstractVideoSurface>
#include <QVideoSurfaceFormat>
#include "myfilter.h"

class Filter : public QAbstractVideoFilter {
	Q_OBJECT
	
	Q_PROPERTY (QAbstractVideoSurface *videoSurface WRITE setVideoSurface READ getVideoSurface NOTIFY videoSurfaceChanged)

	Q_PROPERTY (int hmin WRITE setHMin READ getHMin NOTIFY hminChanged)
	Q_PROPERTY (int hmax WRITE setHMax READ getHMax NOTIFY hmaxChanged)
	Q_PROPERTY (int smin WRITE setSMin READ getSMin NOTIFY sminChanged)
	Q_PROPERTY (int smax WRITE setSMax READ getSMax NOTIFY smaxChanged)
	Q_PROPERTY (int vmin WRITE setVMin READ getVMin NOTIFY vminChanged)
	Q_PROPERTY (int vmax WRITE setVMax READ getVMax NOTIFY vmaxChanged)
	Q_PROPERTY (int colorIdx WRITE setColorIdx READ getColorType NOTIFY colorIdxChanged) 
	Q_PROPERTY (int showType WRITE setShowType READ getShowType NOTIFY onShowTypeChanged)
	Q_PROPERTY (int erodeX WRITE setErodeX READ getErodeX NOTIFY onErodeXChanged)
	Q_PROPERTY (int erodeY WRITE setErodeY READ getErodeY NOTIFY onErodeYChanged)
	Q_PROPERTY (int dilateX WRITE setDilateX READ getDilateX NOTIFY onDilateXChanged)
	Q_PROPERTY (int dilateY WRITE setDilateY READ getDilateY NOTIFY onDilateYChanged)
public:
	Filter(QObject *parent=nullptr);
	

	Q_INVOKABLE QVideoFilterRunnable *createFilterRunnable() override;
	Q_INVOKABLE void setVideoSurface(QAbstractVideoSurface *);
	Q_INVOKABLE QAbstractVideoSurface *getVideoSurface();
	void setNewFrame(QVideoFrame frame, QVideoSurfaceFormat format);

	Q_INVOKABLE void setHMin(int);
	Q_INVOKABLE int getHMin();
	Q_INVOKABLE void setHMax(int);
	Q_INVOKABLE int getHMax();

	Q_INVOKABLE void setSMin(int);
	Q_INVOKABLE int getSMin();
	Q_INVOKABLE void setSMax(int);
	Q_INVOKABLE int getSMax();

	Q_INVOKABLE void setVMin(int);
	Q_INVOKABLE int getVMin();
	Q_INVOKABLE void setVMax(int);
	Q_INVOKABLE int getVMax();

	Q_INVOKABLE void setColorIdx(int);
	Q_INVOKABLE int getColorType();
	
	Q_INVOKABLE void setShowType(int);
	Q_INVOKABLE int getShowType();

	Q_INVOKABLE void setErodeX(int);
	Q_INVOKABLE int getErodeX();
	Q_INVOKABLE void setErodeY(int);
	Q_INVOKABLE int getErodeY();

	Q_INVOKABLE void setDilateX(int);
	Q_INVOKABLE int getDilateX();
	Q_INVOKABLE void setDilateY(int);
	Q_INVOKABLE int getDilateY();
	
	Q_INVOKABLE void copy(QString);
signals:
	void videoSurfaceChanged(QAbstractVideoSurface*);
	void hminChanged();
	void hmaxChanged();
	void sminChanged();
	void smaxChanged();
	void vminChanged();
	void vmaxChanged();
	void colorIdxChanged();
	void onShowTypeChanged();
	void onErodeXChanged();
	void onErodeYChanged();
	void onDilateXChanged();
	void onDilateYChanged();

private:
	QAbstractVideoSurface *mSurface;
	MyFilter *mVideoFilterRunnable;

	int mHMin{0}, mHMax{179}
	  , mSMin{0}, mSMax{255}
	  , mVMin{0}, mVMax{255}
	  , mColorIdx{8}, mShowType{0}
	  ,mEroX{1}, mEroY{1}, mDilX{1}, mDilY{1};
};

#endif
