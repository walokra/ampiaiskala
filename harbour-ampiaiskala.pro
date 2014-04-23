TARGET = harbour-ampiaiskala

# Application version
DEFINES += APP_VERSION=\\\"$$VERSION\\\"
DEFINES += APP_RELEASE=\\\"$$RELEASE\\\"

CONFIG += sailfishapp
QT += xml

SOURCES += \
    main.cpp \
    src/feedloader.cpp

HEADERS += \
    src/feedloader.h

OTHER_FILES = \
    rpm/harbour-ampiaiskala.yaml \
    qml/MainPage.qml \
    qml/Constants.qml \
    qml/Settings.qml \
    qml/main.qml \
    qml/FeedModel.qml \
    qml/SourcesModel.qml \
    qml/AtomModel.qml \
    qml/FeedsPage.qml \
    qml/AboutPage.qml \
    qml/WebPage.qml \
    qml/CoverPage.qml

INCLUDEPATH += $$PWD
