qt_add_library(mainui STATIC)
qt_add_qml_module(mainui
    URI "mainui"
    VERSION 1.0
    QML_FILES
        home/Dashboard.qml
        home/Header.qml
        home/HomePage.qml
        mainmenu/MainMenu.qml
        mainmenu/MainMenuList.qml
        mainmenu/UserInfo.qml
)
