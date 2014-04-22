import QtQuick 2.1
import Sailfish.Silica 1.0

Dialog {
    id: feedsPage

    allowedOrientations: Orientation.All

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
                checked: settings.feeds_kaikki
                onCheckedChanged: {
                    console.log("All: " + checked)
                    checked ? settings.feeds_kaikki = true : settings.feeds_kaikki = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_kaikki_id, settings.feeds_kaikki_url)
                    //feedModel.refresh()
                }
            }

            TextSwitch {
                text: qsTr("News")
                checked: settings.feeds_uutiset
                onCheckedChanged: {
                    checked ? settings.feeds_uutiset = true : settings.feeds_uutiset = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_uutiset_id, settings.feeds_uutiset_url)
                }
            }

            TextSwitch {
                text: qsTr("News & entertainment")
                checked: settings.feeds_uutiset_viihde
                onCheckedChanged: {
                    checked ? settings.feeds_uutiset_viihde = true : settings.feeds_uutiset_viihde = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_uutiset_viihde_id, settings.feeds_uutiset_viihde_url)
                }
            }

            TextSwitch {
                text: qsTr("News & sports")
                checked: settings.feeds_uutiset_urheilu
                onCheckedChanged: {
                    checked ? settings.feeds_uutiset_urheilu = true : settings.feeds_uutiset_urheilu = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_uutiset_urheilu_id, settings.feeds_uutiset_urheilu_url)
                }
            }

            TextSwitch {
                text: qsTr("Entertainment news")
                checked: settings.feeds_viihdeuutiset
                onCheckedChanged: {
                    checked ? settings.feeds_viihdeuutiset = true : settings.feeds_viihdeuutiset = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_viihdeuutiset_id, settings.feeds_viihdeuutiset_url)
                }
            }

            TextSwitch {
                text: qsTr("Sports news")
                checked: settings.feeds_urheiluuutiset
                onCheckedChanged: {
                    checked ? settings.feeds_urheiluuutiset = true : settings.feeds_urheiluuutiset = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_urheiluuutiset_id, settings.feeds_urheiluuutiset_url)
                }
            }

            TextSwitch {
                text: qsTr("Province news")
                checked: settings.feeds_maakuntauutiset
                onCheckedChanged: {
                    checked ? settings.feeds_maakuntauutiset = true : settings.feeds_maakuntauutiset = false;
                    sourcesModel.clear()
                    sourcesModel.addSource(settings.feeds_maakunta_uutiset_id, settings.feeds_maakunta_uutiset_url)
                }
            }
        }

        VerticalScrollDecorator { flickable: flickable }
    }

    onAccepted: {
        console.log("onAccepted!")
    }

    Component.onCompleted: {
    }

}


