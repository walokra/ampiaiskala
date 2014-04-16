TARGET = harbour-ampiaiskala

# Application version
DEFINES += APP_VERSION=\\\"$$VERSION\\\"
DEFINES += APP_RELEASE=\\\"$$RELEASE\\\"

CONFIG += sailfishapp

SOURCES += main.cpp

OTHER_FILES = \
    rpm/harbour-ampiaiskala.spec \
    rpm/harbour-ampiaiskala.yaml \
    qml/MainPage.qml \
    qml/Constants.qml \
    qml/Settings.qml \
    qml/main.qml \
    qml/Feed.qml \
    qml/FeedDelegate.qml \
    qml/FeedModel.qml

INCLUDEPATH += $$PWD
