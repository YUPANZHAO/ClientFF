#include "FileCtrl.h"
#include <QFile>
#include <QTextStream>
#include <QDir>

namespace ClientFF::File {

FileCtrl *FileCtrl::instance() {
  static FileCtrl fileCtrl;
  return &fileCtrl;
}

QString FileCtrl::readFile(const QString &fileUrl) {
  QString content;
  QFile file(fileUrl);
  if (file.open(QIODevice::ReadOnly)) {
    content = file.readAll();
    file.close();
  }
  return content;
}

bool FileCtrl::writeFile(const QString &fileUrl, const QString &content) {
  QFile file(fileUrl);
  if (!file.open(QFile::WriteOnly | QFile::Truncate))
    return false;
  QTextStream out(&file);
  out << content;
  file.close();
  return true;
}

QString FileCtrl::tempDir() {
  return QDir::tempPath();
}

} // namespace ClientFF::File
