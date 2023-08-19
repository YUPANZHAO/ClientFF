#ifndef CONFIG_H
#define CONFIG_H

#include <QJsonObject>
#include <QObject>

namespace ClientFF::Config {

class Config : public QObject {
  Q_OBJECT

  Q_PROPERTY(QJsonObject metaData READ metaData WRITE setMetaData NOTIFY
                 metaDataChanged)

public:
  ~Config() = default;
  static Config *instance();

  QJsonObject metaData() const;
  void setMetaData(const QJsonObject &obj);

Q_SIGNALS:
  void metaDataChanged();

private:
  Config();
  Config(const Config &) = default;

public Q_SLOTS:
  QString getStr(const QString &key);
  int getInt(const QString &key);
  double getDouble(const QString &key);

  bool setValue(const QString &key, const QJsonValue &value);

private:
  QJsonObject m_metaData;
};

} // namespace ClientFF::Config

#endif