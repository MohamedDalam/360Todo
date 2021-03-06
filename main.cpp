#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "modeltodo.h"
#include "date.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    Date date;

    QQmlApplicationEngine engine;
    qmlRegisterType<ModelTodo>("ModelLib",1,0,"ModelTodo");
    engine.rootContext()->setContextProperty("_date",&date);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
