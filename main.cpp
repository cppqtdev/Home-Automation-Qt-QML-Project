#include <QScreen>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSystemTrayIcon>
#include <QtQml/QQmlContext>
#include<QIcon>
#include <QDebug>
#include <QtCore/QUrl>
#include <QtCore/QCommandLineOption>
#include <QtCore/QCommandLineParser>
#include <QStyleHints>

#include <systemtray.h>

class Utils : public QObject {
    Q_OBJECT
public:
    Utils(QObject* parent = 0) : QObject(parent) { }
    Q_INVOKABLE static QUrl fromUserInput(const QString& userInput);
};

#include "applicationui.hpp"
int main(int argc, char *argv[])
{
    //! [0]
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    app.setOrganizationName("Aksh Software Solution");
    app.setOrganizationName("akshsoftsolution.com");
    app.setApplicationDisplayName("Aksh Software");
    app.setApplicationName("Aksh Software");
    app.setWindowIcon(QIcon(":/Img/Basic/pngwing.com.png"));
    //! [0]
    ApplicationUI appui;
    QCommandLineParser parser;
    QCoreApplication::setApplicationVersion(QT_VERSION_STR);



    QQmlContext *context = engine.rootContext();
    SystemTray * systemTray = new SystemTray();

    context->setContextProperty("systemTray", systemTray);
    context->setContextProperty("myApp", &appui);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
