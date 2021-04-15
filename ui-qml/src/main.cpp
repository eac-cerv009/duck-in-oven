#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QIcon>

#include <controllers/mastercontroller.h>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
  QCoreApplication::setApplicationName("DuckInOven by Esther Covarrubias");
  QCoreApplication::setOrganizationName("ICS");

  QGuiApplication app(argc, argv);

  qmlRegisterType<controllers::MasterController>("DIO", 1, 0, "MasterController");
  qmlRegisterType<controllers::UiControlFlow>("DIO", 1, 0, "UiControlFlow");
  qmlRegisterType<controllers::OvenControlState>("DIO", 1, 0, "OvenControlState");
  qmlRegisterType<controllers::connectivity::WiFi>("DIO", 1, 0, "WiFi");
  qmlRegisterType<controllers::connectivity::Bluetooth>("DIO", 1, 0, "Bluetooth");

  controllers::MasterController masterController;

  //! [icons]
  QIcon::setThemeName(QStringLiteral("duckInOvenTheme"));
  //! [icons]

  QQmlApplicationEngine engine;

  engine.addImportPath("qrc:/");
  engine.rootContext()->setContextProperty("masterController", &masterController);

  const QUrl url(QStringLiteral("qrc:/views/MainScreen.qml"));
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
