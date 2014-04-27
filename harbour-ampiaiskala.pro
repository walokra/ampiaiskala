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
    rpm/harbour-ampiaiskala.spec \
    rpm/harbour-ampiaiskala.yaml \
    rpm/harbour-ampiaiskala.changes \
    translations/*.ts \
    qml/components/storage.js \
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

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n
TRANSLATIONS += translations/harbour-ampiaiskala-fi.ts
