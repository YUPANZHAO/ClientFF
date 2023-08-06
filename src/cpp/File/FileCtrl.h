#ifndef FILECTRL_H
#define FILECTRL_H

#include <QObject>

namespace ClientFF::File {

class FileCtrl : public QObject {
  Q_OBJECT
public:
  ~FileCtrl() = default;
  static FileCtrl *instance();

private:
  FileCtrl() = default;
  FileCtrl(const FileCtrl &file) = default;

public Q_SLOTS:
  QString readFile(const QString &fileUrl);
  bool writeFile(const QString &fileUrl, const QString &content);
};

} // namespace ClientFF::File

#endif