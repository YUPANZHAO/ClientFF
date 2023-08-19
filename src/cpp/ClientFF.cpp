#include "ClientFF.h"
#include <QQmlContext>

namespace ClientFF {

void registerTypes(QQmlEngine *engine) {
  auto *root = engine->rootContext();

  auto *file = File::FileCtrl::instance();
  root->setContextProperty("file", file);

  auto *config = Config::Config::instance();
  root->setContextProperty("globalConfig", config);
}

} // namespace ClientFF