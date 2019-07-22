#ifndef T2DWORLD_H
#define T2DWORLD_H

#include <QObject>
#include <QQuickItem>

class T2DWorld : public QQuickItem
{
    Q_OBJECT
public:
    T2DWorld(QQuickItem* parent = nullptr);

    Q_PROPERTY(QString globalTheme READ globalTheme WRITE setGlobalTheme NOTIFY globalThemeChanged)
    Q_PROPERTY(QString importThemePath READ importThemePath WRITE setImportThemePath NOTIFY importThemePathChanged)

    QString importThemePath() const;
    QString globalTheme() const;

signals:
    void importThemePathChanged();
    void globalThemeChanged();

private slots:
    void setImportThemePath(const QString& importThemePath);
    void setGlobalTheme(const QString& globalTheme);
    void onParentChanged();

private:
    QString m_importThemePath;
    QString m_globalTheme;
};

#endif // T2DWORLD_H
