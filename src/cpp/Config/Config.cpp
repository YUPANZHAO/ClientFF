#include <QJsonDocument>
#include <string>

#include "../File/FileCtrl.h"
#include "Config.h"

namespace ClientFF::Config {

Config *Config::instance() {
  static Config instance;
  return &instance;
}

QJsonObject Config::metaData() const { return m_metaData; }

void Config::setMetaData(const QJsonObject &obj) {
  if (obj == m_metaData)
    return;
  m_metaData = obj;
  emit metaDataChanged();
}

Config::Config() {
  QString config_file_path = "config/config.json";
  auto content = File::FileCtrl::instance()->readFile(config_file_path);
  m_metaData = QJsonDocument::fromJson(content.toUtf8()).object();
  connect(this, &Config::metaDataChanged, this, [config_file_path, this]() {
    File::FileCtrl::instance()->writeFile(
        config_file_path, QString(QJsonDocument(this->m_metaData).toJson()));
  });
}

QString Config::getStr(const QString &key) {
  return m_metaData.value(key).toString();
}

int Config::getInt(const QString &key) { return m_metaData.value(key).toInt(); }

double Config::getDouble(const QString &key) {
  return m_metaData.value(key).toDouble();
}

bool Config::setValue(const QString &key, const QJsonValue &value) {
  m_metaData[key] = value;
  emit metaDataChanged();
  return true;
}

} // namespace ClientFF::Config
