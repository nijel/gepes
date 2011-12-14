#include <QTranslator>
#include <QLocale>
#include <QtGui/QApplication>
#include "qmlapplicationviewer.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QString locale = QLocale::system().name();

    QTranslator translator;
    translator.load(locale, "/opt/gepes/l10n");
    app.installTranslator(&translator);

    QmlApplicationViewer viewer;
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
    viewer.setMainQmlFile(QLatin1String("qml/gepes/main.qml"));
    viewer.showExpanded();

    return app.exec();
}
