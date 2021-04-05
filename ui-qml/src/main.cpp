#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
  QCoreApplication::setApplicationName("DuckInOven by ICS");

  QGuiApplication app(argc, argv);

  QIcon::setThemeName(QStringLiteral("duckInOvenTheme"));

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/views/MainScreen.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
