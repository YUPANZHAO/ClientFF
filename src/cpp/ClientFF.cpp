#include "ClientFF.h"
#include "File/FileCtrl.h"
#include <QQmlContext>

namespace ClientFF {

void registerTypes(QQmlEngine *engine) {
  auto *root = engine->rootContext();

  auto *file = File::FileCtrl::instance();
  root->setContextProperty("file", file);
}

} // namespace ClientFF