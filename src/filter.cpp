#include "filter.h"
#include "colorutil.h"
#include <QClipboard>
#include <QMessageBox>
#include <QGuiApplication>
#include <QWidget>


Filter::Filter(QObject *parent) 
	: QAbstractVideoFilter(parent)
{
	mVideoFilterRunnable = new MyFilter(this);
}




QVideoFilterRunnable *Filter::createFilterRunnable() {
	return mVideoFilterRunnable;
}


void Filter::setVideoSurface(QAbstractVideoSurface *surface) {
	mSurface = surface;
	emit videoSurfaceChanged(mSurface);
}

QAbstractVideoSurface *Filter::getVideoSurface() {
	return mSurface;
}

void Filter::setNewFrame(QVideoFrame frame, QVideoSurfaceFormat format) {
	if (not mSurface)
		return;
	if (not mSurface->isActive())	
		mSurface->start(format);
	mSurface->present(frame);
}	

void Filter::setHMin(int value) {
	mHMin = value;
	emit hminChanged();
}
int Filter::getHMin() {
	return mHMin;
}

void Filter::setHMax(int value) {
	mHMax = value;
	emit hmaxChanged();
}

int Filter::getHMax() {
	return mHMax;
}


void Filter::setSMin(int value) {
	mSMin = value;
	emit sminChanged();
}
int Filter::getSMin() {
	return mSMin;
}

void Filter::setSMax(int value) {
	mSMax = value;
	emit smaxChanged();
}

int Filter::getSMax() {
	return mSMax;
}


void Filter::setVMin(int value) {
	mVMin = value;
	emit vminChanged();
}
int Filter::getVMin() {
	return mVMin;
}

void Filter::setVMax(int value) {
	mVMax = value;
	emit vmaxChanged();
}

int Filter::getVMax() {
	return mVMax;
}

void Filter::setColorIdx(int idx) {
	mColorIdx = idx;
	emit colorIdxChanged();
}

int Filter::getColorType() {
	return idx2bgr[mColorIdx];
}

void Filter::setShowType(int tp) {
	mShowType = tp;
	emit onShowTypeChanged();
}

int Filter::getShowType() {
	return mShowType;
}

void Filter::setErodeX(int value) {
	mEroX = value;
	emit onErodeXChanged();
}

int Filter::getErodeX() {
	return mEroX;
}


void Filter::setErodeY(int value) {
	mEroY = value;
	emit onErodeYChanged();
}

int Filter::getErodeY() {
	return mEroY;
}

void Filter::setDilateX(int value) {
	mDilX = value;
	emit onDilateXChanged();
}

int Filter::getDilateX() {
	return mDilX;
}

void Filter::setDilateY(int value) {
	mDilY = value;
	emit onDilateYChanged();
}

int Filter::getDilateY() {
	return mDilY;
}


void Filter::copy(QString value) {
	QClipboard *cb = QGuiApplication::clipboard();
	QWidget w;

	cb->setText(value);
	
	QMessageBox::information(&w, "copied with sucess", tr("values: %1\nhas been copied to clipboard.").arg(value));
}
