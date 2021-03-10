#include "widget.h"
#include <QQmlContext>
#include <QQmlError>
#include <QMessageBox>
#include <QApplication>
#include <QDesktopWidget>
#include <QRect>
#include "filter.h"

widget::widget(QWidget *w)
	: QWidget(w)
{
	build();
	configure();
	setLayouts();

}


void widget::build()
{
	mVLayout = new QVBoxLayout(this);
	mQuick = new QQuickWidget(this);
}


void widget::configure()
{
	QRect rec = QApplication::desktop()->screenGeometry();
	mSize = QSize(rec.width(), rec.height());

	mQuick->setFixedSize(mSize);
	qmlRegisterType<Filter>("my.filter", 1,0, "Myfilter");
	mQuick->rootContext()->setContextProperty("widget", this);
	mQuick->setSource(QUrl(QStringLiteral("qrc:/main.qml")));

	QList<QQmlError> l = mQuick->errors();
        if (l.count() > 0)
        {
                QString errors;
                for (auto err : l)
                {
                        errors += err.description();
                        errors += "\n";
                }
                QMessageBox::warning(this, tr("%1 erros on qml's source").arg
(l.count()), errors);
        }
}

void widget::setLayouts()
{

	mVLayout->addWidget(mQuick);
	setLayout(mVLayout);
	mVLayout->setMargin(0);
	mVLayout->setSpacing(0);
}


QSize widget::getSize()
{
	return mSize;
}


