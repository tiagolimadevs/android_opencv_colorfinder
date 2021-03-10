#ifndef __WIDGET_H__
#define __WIDGET_H__

#include <QWidget>
#include <QVBoxLayout>
#include <QQuickWidget>


class widget : public QWidget
{
	Q_OBJECT
public:
	widget(QWidget *w = NULL);
	
	Q_INVOKABLE QSize getSize();


private:
	void build();
	void configure();
	void setLayouts();


	QVBoxLayout *mVLayout;
	QQuickWidget *mQuick;
	QSize mSize;
};



#endif
