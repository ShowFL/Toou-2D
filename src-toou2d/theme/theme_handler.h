#ifndef THEMEHANDLER_H
#define THEMEHANDLER_H

#include <QObject>
#include <QVariant>
#include <QFile>
#include <QSettings>
#include <QFileInfo>

#define INI_GENERAL_STR  "GENERAL"
#define INI_CONFIG_STR   "CONFIG"
#define INI_CONTROLS_STR "CONTROLS"

class ThemeHandler : public QObject
{
    Q_OBJECT
public:
    ThemeHandler(const QString &name, const QString& rec_path);

    QString name();
    bool isValid();
    bool load();
    bool isLoad();

    void findPropertyValue(const QString &className, const QString& groupName, const QString &tpName, const QString& state, const QString& property, QVariant& result);
    const QMap<QString, QVariantMap *> &data();
    const QVariantMap &toQVariantMap();

private:
    void parseMain();
    void parseINI(const QString &filename, QVariantMap &varmap);
private:
    QString m_name;
    QString m_path;
    QVariantMap m_information;
    QMap<QString,QVariant> m_inifiles;
    QMap<QString,QVariantMap*> m_data;

    bool    m_valid = false;
};

#endif // THEMEHANDLER_H
