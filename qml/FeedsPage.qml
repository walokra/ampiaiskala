import QtQuick 2.1
import Sailfish.Silica 1.0

Dialog {
    id: feedsPage

    allowedOrientations: Orientation.All

    property string selected : "";

    SilicaFlickable {
        id: flickable

        anchors.fill: parent

        DialogHeader {
            id: header
            title: qsTr("Feeds")
            acceptText: qsTr("Save")
        }

        Column {
            id: contentArea;
            anchors { top: header.bottom; left: parent.left; right: parent.right }
            width: parent.width
            height: childrenRect.height

            anchors.leftMargin: constants.paddingMedium
            anchors.rightMargin: constants.paddingMedium

            SectionHeader { text: qsTr("Basic feeds") }

            TextSwitch {
                text: qsTr("All")
                checked: selected === settings.feeds_kaikki_id
                onCheckedChanged: {
                    console.log("All: " + checked)
                    checked ? selected = settings.feeds_kaikki_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("News")
                checked: selected === settings.feeds_uutiset_id
                onCheckedChanged: {
                    console.log("News: " + checked)
                    checked ? selected = settings.feeds_uutiset_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("News & entertainment")
                checked: selected === settings.feeds_uutiset_viihde_id
                onCheckedChanged: {
                    console.log("News & entertainment: " + checked)
                    checked ? selected = settings.feeds_uutiset_viihde_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("News & sports")
                checked: selected === settings.feeds_uutiset_urheilu_id
                onCheckedChanged: {
                    console.log("News & sports: " + checked)
                    checked ? selected = settings.feeds_uutiset_urheilu_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("Entertainment news")
                checked: selected === settings.feeds_uutiset_viihde_id
                onCheckedChanged: {
                    console.log("Entertainment news: " + checked)
                    checked ? selected = settings.feeds_uutiset_viihde_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("Sports news")
                checked: selected === settings.feeds_urheilu_id
                onCheckedChanged: {
                    console.log("Sports news: " + checked)
                    checked ? selected = settings.feeds_urheilu_id : selected = "";
                }
            }

            TextSwitch {
                text: qsTr("Province news")
                checked: selected === settings.feeds_maakunnat_id
                onCheckedChanged: {
                    console.log("Province news: " + checked)
                    checked ? selected = settings.feeds_maakunnat_id : selected = "";
                }
            }
        }

        VerticalScrollDecorator { flickable: flickable }
    }

    onAccepted: {
        console.log("onAccepted! selected: " + selected)
        sourcesModel.clear()
        settings.feeds_basic_selected = selected;
        sourcesModel.addSource(settings.feeds_basic_selected)
        settings.saveFeedSettings();
    }

    Component.onCompleted: {
    }

}


