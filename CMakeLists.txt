cmake_minimum_required(VERSION 3.16)

project(QDashboardApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(QDashboardApp src/main.cpp)

qt_add_resources(QDashboardApp "configuration"
    PREFIX "/"
    FILES
        qtquickcontrols2.conf
)

include(qmlmodules)

target_link_libraries(QDashboardApp PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
)

install(TARGETS QDashboardApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
