import QtQuick 2.1
import Sailfish.Silica 1.0

Page {
    id: aboutPage;
    allowedOrientations: Orientation.All;

    SilicaFlickable {
        id: flickable;

        anchors.fill: parent;
        contentHeight: contentArea.height + 2 * constants.paddingLarge;

        PageHeader {
            id: header;
            title: qsTr("About Ampiaiskala");
        }

        Column {
            id: contentArea;
            anchors { top: header.bottom; left: parent.left; right: parent.right }
            height: childrenRect.height;

            anchors.leftMargin: constants.paddingMedium;
            anchors.rightMargin: constants.paddingMedium;

            //SectionHeader { text: qsTr("About") }

            Item {
                anchors { left: parent.left; right: parent.right; }
                height: aboutText.height;

                Label {
                    id: aboutText;
                    width: parent.width;
                    wrapMode: Text.Wrap;
                    font.pixelSize: constants.fontSizeMedium;
                    text: qsTr("Ampiaiskala is a feed reader for Ampparit.com news feeds.")
                }
            }

            SectionHeader { text: qsTr("Version") }

            Item {
                anchors { left: parent.left; right: parent.right; }
                height: versionText.height;

                Label {
                    id: versionText;
                    width: parent.width;
                    font.pixelSize: constants.fontSizeMedium;
                    wrapMode: Text.Wrap;
                    text: APP_VERSION + "-" + APP_RELEASE;
                }
            }

            SectionHeader { text: qsTr("Developed By"); }

            ListItem {
                id: root;

                Image {
                    id: rotImage;
                    source: "images/rot_tr_86x86.png";
                    width: 86;
                    height: 86;
                }
                Label {
                    anchors { left: rotImage.right; leftMargin: constants.paddingLarge;}
                    text: "Marko Wallin, @walokra"
                    font.pixelSize: constants.fontSizeLarge
                }
            }

            SectionHeader { text: qsTr("Powered By") }

            ListItem {
                Image {
                    id: qtImage;
                    source: "images/qt_icon.png";
                    width: 80;
                    height: 80;
                }
                Label {
                    anchors { left: qtImage.right; leftMargin: constants.paddingLarge; }
                    text: "Qt + QML";
                    font.pixelSize: constants.fontSizeLarge;
                }
            }
        }

        VerticalScrollDecorator { flickable: flickable }
    }

}
