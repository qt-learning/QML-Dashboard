#include <QGuiApplication>

void set_qt_environment()
{
    qputenv("QML_COMPAT_RESOLVE_URLS_ON_ASSIGNMENT", "1");
    qputenv("QT_QUICK_CONTROLS_CONF", ":/qtquickcontrols2.conf");

}
