#include "theme_handler.h"

#include <QTextCodec>
#include <QDebug>
#include <QUrl>
#include <QFile>
ThemeHandler::ThemeHandler(const QString &name, const QString &rec_path):
    QObject(nullptr),
    m_name(name),
    m_path(rec_path)
{
    parseMain();
}

QString ThemeHandler::name()
{
    return m_name;
}

bool ThemeHandler::isValid()
{
    return !m_information.isEmpty() && !m_inifiles.isEmpty();
}

bool ThemeHandler::load()
{
    QMap<QString, QVariant>::const_iterator datafile = m_inifiles.constBegin();
    while (datafile != m_inifiles.constEnd()) {
        QVariantMap* groupdata = new QVariantMap();
        parseINI(datafile.value().toString(),*groupdata);

        //save or delete.. data;
        if(!groupdata->isEmpty()){
            m_data.insert( datafile.key(),groupdata);
        }else {
            delete groupdata;
        }

        ++datafile;
    }

    return true;
}

bool ThemeHandler::isLoad()
{
    return !m_data.isEmpty();
}

void ThemeHandler::findPropertyValue(const QString& type, const QString &property, const QString &state, const QString &objname, QVariant &value)
{
    if(!m_data.contains(type)){
        return ;
    }
    QVariantMap* group = m_data.value(type);

    QStringList checkkeys;
    checkkeys.append(objname + ":" + state);
    checkkeys.append(":" + state);
    checkkeys.append(objname);
    checkkeys.append(INI_BASIC_STR);

    foreach (QString key, checkkeys) {
        QVariantMap childv;

        if(group->contains(key)){
            childv = group->value(key).toMap();
        }

        if(childv.contains(property)){
            value.setValue(childv.value(property));
            break;
        }
    }
}

const QMap<QString, QVariantMap*> &ThemeHandler::data()
{
    return m_data;
}

void ThemeHandler::parseMain()
{

    QVariantMap maindata;
    parseINI("main.ini",maindata);

    QStringList groups = maindata.keys();

    foreach (QString group, groups) {
        if(group == INI_CONFIG_STR){
            QVariantMap configs = maindata.value(INI_CONFIG_STR).toMap();
            QStringList configkeys = configs.keys();

            if(configkeys.contains("about"))
                m_information.insert("about",configs.value("about"));

            if(configkeys.contains("version"))
                m_information.insert("version",configs.value("version"));

            if(configkeys.contains("author"))
                m_information.insert("author",configs.value("author"));

            if(configkeys.contains("logo")){
                QString logo = configs.value("logo").toString();
                if(m_path.indexOf(":") == 0){
                    m_information.insert("logo","qrc" + m_path + "/" + logo);
                }
            }

            if(configkeys.contains("sample")){
                QString sample = configs.value("sample").toString();
                if(m_path.indexOf(":") == 0){
                    m_information.insert("sample","qrc" + m_path + "/" + sample);
                }
            }
        }

        else if(groups.contains(INI_CONTROLS_STR)){
            m_inifiles = maindata.value(INI_CONTROLS_STR).toMap();
        }
    }

    if(!m_information.isEmpty() && !m_inifiles.isEmpty()){
        m_information.insert("name",m_name);
    }
}

void ThemeHandler::parseINI(const QString& filename,QVariantMap& varmap)
{
    QVariantMap curmap;
    QString     curgroup;

    QFile file(m_path + "/" + filename);
    if(!file.open(QFile::ReadOnly))
        return;

    QString str =  QString::fromUtf8( file.readLine());
    while(!str.isEmpty()){
        str.replace(QRegExp(";(.*)"),"");

        int gli = str.indexOf('[');
        int gri =  str.indexOf(']');

        if(gli != -1 && gri != -1){
            if(!curmap.isEmpty() && !curgroup.isEmpty()){
                varmap.insert(curgroup,curmap);
                curmap.clear();
            }

            curgroup = str.mid(gli + 1 , gri - 1);
        }else{
            QRegExp rx("(.*)=(.*)");
            int pot = str.indexOf(rx);
            if(pot != -1){
                curmap.insert(rx.cap(1).trimmed(),rx.cap(2).trimmed());
            }
        }

        str =  QString::fromUtf8( file.readLine());
    }

    file.close();  //my macos 0.000219 s

    if(!curmap.isEmpty() && !curgroup.isEmpty()){
        varmap.insert(curgroup,curmap);
    }
}

const QVariantMap &ThemeHandler::toQVariantMap()
{
    return m_information;
}
