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

                    SearchField {
                        width: parent.width

                        font.pixelSize: constants.fontSizeSmall;
                        font.bold: false;
                        placeholderText: qsTr("Hae syöte...");

                        onTextChanged: if (feedModel.feedName) feedModel.feedName = ""
                        Keys.onEnterPressed: { feedModel.getFeed(text) }
                        Keys.onReturnPressed: { feedModel.getFeed(text) }
                    }
        }

        SilicaListView {
            id: listView

            anchors.fill: parent
            cacheBuffer: 4000

            ViewPlaceholder {
                property bool busy: feedModel.status === XmlListModel.Loading
                property string error: feedModel.status === XmlListModel.Error ? feedModel.errorString() : ""

                enabled: !listView.count
                text: busy ? qsTr("Loading...") : error ? qsTr("Error") : qsTr("No items in feed")
            }

            model: FeedModel {
                id: feedModel
                function getFeed(text) {
                    feedName = ""
                    feedName = text
                    reload()
                }
            }

            delegate: FeedDelegate {
                id: delegate
                title: model.title
                updated: model.updated && model.updated != "0000-00-00" ? model.updated : qsTr("No date")
                link: model.link

                onClicked: {
                    console.log("item clicked!")
                }
            }

            VerticalScrollDecorator { }
        }
    }

}


