#include <FramelessQuickModule>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

FRAMELESSHELPER_USE_NAMESPACE

int main(int argc, char *argv[]) {
  FramelessHelper::Quick::initialize();

  QGuiApplication app(argc, argv);

  FramelessHelper::Core::setApplicationOSThemeAware();

  QQmlApplicationEngine engine;

  FramelessHelper::Quick::registerTypes(&engine);

  const QUrl url(QStringLiteral("qrc:/ClientFF/qml/main.qml"));
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}