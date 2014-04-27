import QtQuick 2.1
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: mainPage

    Connections {
        target: coverAdaptor

        onRefresh: {
            feedModel.refresh();
        }

        onAbort: {
            feedModel.abort();
        }
    }

    SilicaFlickable {
        id: flickable

        anchors.fill: parent

        PageHeader { id: header; title: constants.appName }

        PullDownMenu {
            id: pullDownMenu

            MenuItem {
                id: aboutMenu
                text: qsTr("About")
                onClicked: {
                    pageStack.push(aboutPage)
                }
            }

            MenuItem {
                id: feedsMenu
                text: qsTr("Feeds")
                onClicked: {
                    pageStack.push(feedsPage)
                }
            }

            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    feedModel.refresh()
                }
            }
        }

        SilicaListView {
            id: listView

            anchors { top: header.bottom; left: parent.left; right: parent.right; bottom: parent.bottom; }
            anchors.margins: constants.paddingSmall;

            cacheBuffer: 4000

            ViewPlaceholder {
                enabled: sourcesModel.count > 0 && !feedModel.busy && feedModel.count === 0
                text: qsTr("Pull down to refresh")
            }

            model: feedModel

            delegate: Column {
                id: feedItem

                opacity: feedModel.busy ? 0.2 : 1
                enabled: !feedModel.busy
                clip: true

                width: listView.width
                spacing: constants.paddingSmall

                Label {
                    id: titleLbl
                    width: parent.width
                    font.pixelSize: constants.fontSizeSmall
                    color: constants.colorPrimary
                    textFormat: Text.PlainText
                    wrapMode: Text.Wrap;
                    text: title

                    MouseArea {
                        enabled: link !== ""
                        anchors.fill: parent
                        onClicked: {
                            var props = {
                                "url": link
                            }
                            pageStack.push(Qt.resolvedUrl("WebPage.qml"), props);
                        }
                    }
                }

                Label {
                    id: updatedLbl
                    width: parent.width
                    font.pixelSize: constants.fontSizeXXSmall
                    color: constants.colorHighlight
                    textFormat: Text.PlainText
                    text: "(" + Format.formatDate(updated, Formatter.DurationElapsed) + ")"
                }

                Separator {
                    anchors { left: parent.left; right: parent.right; }
                    color: constants.colorSecondary;
                }
            }

            // Timer for top/bottom buttons
            Timer {
                id: idle;
                property bool moving: listView.moving || listView.dragging || listView.flicking;
                property bool menuOpen: pullDownMenu.active;
                onMovingChanged: if (!moving && !menuOpen) restart();
                interval: listView.atYBeginning || listView.atYEnd ? 300 : 2000;
            }

            // to top button
            Rectangle {
                visible: opacity > 0;
                width: 64;
                height: 64;
                anchors { top: listView.top; right: listView.right; margins: Theme.paddingLarge; }
                radius: 75;
                color: Theme.highlightBackgroundColor;
                opacity: (idle.moving || idle.running) && !idle.menuOpen ? 1 : 0;
                Behavior on opacity { FadeAnimation { duration: 300; } }

                IconButton {
                    anchors.centerIn: parent;
                    icon.source: "image://theme/icon-l-up";
                    onClicked: {
                        listView.cancelFlick();
                        listView.scrollToTop();
                    }
                }
            }

            // to bottom button
            Rectangle {
                visible: opacity > 0;
                width: 64;
                height: 64;
                anchors { bottom: listView.bottom; right: listView.right; margins: constants.paddingLarge; }
                radius: 75;
                color: Theme.highlightBackgroundColor;
                opacity: (idle.moving || idle.running) && !idle.menuOpen ? 1 : 0;
                Behavior on opacity { FadeAnimation { duration: 300; } }

                IconButton {
                    anchors.centerIn: parent;
                    icon.source: "image://theme/icon-l-down";
                    onClicked: {
                        listView.cancelFlick();
                        listView.scrollToBottom();
                    }
                }
            }

            VerticalScrollDecorator { flickable: flickable }
        }
    }

    BusyIndicator {
        anchors.centerIn: parent
        running: feedModel.busy
        size: BusyIndicatorSize.Large
    }

    Label {
        visible: feedModel.busy
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: Theme.paddingMedium
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Theme.fontSizeMedium
        color: Theme.secondaryColor
        truncationMode: TruncationMode.Fade
        text: feedModel.currentlyLoading
    }

}


