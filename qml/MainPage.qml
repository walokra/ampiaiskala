import QtQuick 2.1
import Sailfish.Silica 1.0
import QtQuick.XmlListModel 2.0

Page {
    id: mainPage

    SilicaFlickable {
        id: flickable;

        anchors.fill: parent;

        PageHeader { id: header; title: constants.appName; }

        PullDownMenu {
            id: pullDownMenu;

            MenuItem {
                text: qsTr("Refresh")
                onClicked: {
                    feedModel.refresh();
                }
            }
        }

        SilicaListView {
            id: listView

            anchors { top: header.bottom; left: parent.left; right: parent.right; bottom: parent.bottom; }
            anchors.margins: constants.paddingSmall;

            cacheBuffer: 4000

            ViewPlaceholder {
                enabled: sourcesModel.count > 0 &&
                         ! feedModel.busy &&
                         feedModel.count === 0
                text: qsTr("Pull down to refresh.")
            }

            model: feedModel

            delegate: ListItem {
                id: feedItem

                opacity: feedModel.busy ? 0.2 : 1
                enabled: ! feedModel.busy
                clip: true

                width: listView.width

                Column {
                    id: column
                    spacing: constants.paddingSmall
                    width: parent.width

                    Label {
                        id: titleLbl
                        width: parent.width
                        font.pixelSize: constants.fontSizeSmall
                        color: constants.colorPrimary
                        textFormat: Text.PlainText
                        elide: Text.ElideRight
                        text: title

                        MouseArea {
                            enabled: link !== ""
                            anchors.fill: parent
                            onClicked: {
                                Qt.openUrlExternally(link);
                            }
                        }
                    }

                    Label {
                        id: updatedLbl
                        width: parent.width
                        font.pixelSize: constants.fontSizeXXSmall
                        color: constants.colorHighlight
                        textFormat: Text.PlainText
                        elide: Text.ElideRight
                        text: updated
                    }
                }
            }

            VerticalScrollDecorator { }
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


