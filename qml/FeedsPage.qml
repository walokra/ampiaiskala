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

        contentHeight: contentArea.height;

        Column {
            id: contentArea;
            anchors { top: header.bottom; left: parent.left; right: parent.right }
            width: parent.width

            anchors.leftMargin: constants.paddingMedium
            anchors.rightMargin: constants.paddingMedium

            SectionHeader { text: qsTr("Basic feed") }

            ComboBox {
                id: feedModeBox
                currentIndex: 0
                width: parent.width

                label: qsTr("Basic feed") + ":"

                menu: ContextMenu {
                    id: bfCxMenu
                }

                Component {
                    id: menuItemComp
                    MenuItem {}
                }

                Component.onCompleted: {
                    //console.debug("Populating menu");

                    // Basic news feeds
                    settings.createBasicFeeds();
                    settings.feeds_basic_news.forEach(function(entry) {
                        var newMenuItem =
                            menuItemComp.createObject(bfCxMenu._contentColumn, {"text" : entry[1]})
                    });
                }
            }

            SectionHeader { text: qsTr("Specific news feeds") }

            Column {
                id: newsFeeds;
                anchors {left: parent.left; right: parent.right }
                width: parent.width
                height: childrenRect.height
            }

            SectionHeader { text: qsTr("Specific entertainment feeds") }

            SectionHeader { text: qsTr("Specific sports feeds") }

            SectionHeader { text: qsTr("Specific province feeds") }

        }

        VerticalScrollDecorator { flickable: flickable }
    }

    onAccepted: {
        // 0 settings.feeds_kaikki_id
        // 1 settings.feeds_uutiset_id
        // 2 settings.feeds_uutiset_viihde_id
        // 3 settings.feeds_uutiset_urheilu_id
        // 4 settings.feeds_viihde_id
        // 5 settings.feeds_urheilu_id
        // 6 settings.feeds_maakunnat_id

        sourcesModel.clear()
        switch (feedModeBox.currentIndex) {
            case 0:
                settings.feeds_basic_selected = settings.feeds_basic_news[0][0]
                sourcesModel.addSource(settings.feeds_basic_news[0][1], settings.feeds_basic_news[0][2])
                break;
            case 1:
                settings.feeds_basic_selected = settings.feeds_basic_news[1][0]
                sourcesModel.addSource(settings.feeds_basic_news[1][1], settings.feeds_basic_news[1][2])
                break;
            case 2:
                settings.feeds_basic_selected = settings.feeds_basic_news[2][0]
                sourcesModel.addSource(settings.feeds_basic_news[2][1], settings.feeds_basic_news[2][2])
                break;
            case 3:
                settings.feeds_basic_selected = settings.feeds_basic_news[3][0]
                sourcesModel.addSource(settings.feeds_basic_news[3][1], settings.feeds_basic_news[3][2])
                break;
            case 4:
                settings.feeds_basic_selected = settings.feeds_basic_news[4][0]
                sourcesModel.addSource(settings.feeds_basic_news[4][1], settings.feeds_basic_news[4][2])
                break;
            case 5:
                settings.feeds_basic_selected = settings.feeds_basic_news[5][0]
                sourcesModel.addSource(settings.feeds_basic_news[5][1], settings.feeds_basic_news[5][2])
                break;
            case 6:
                settings.feeds_basic_selected = settings.feeds_basic_news[6][0]
                sourcesModel.addSource(settings.feeds_basic_news[6][1], settings.feeds_basic_news[6][2])
                break;
            default:
                settings.feeds_basic_selected = settings.feeds_basic_news[0][0]
                sourcesModel.addSource(settings.feeds_basic_news[0][1], settings.feeds_basic_news[0][2])
        }

        settings.saveFeedSettings();

        settings.feeds_specific_news.forEach(function(entry) {
            console.log("test selected, " + entry[0] + "_sel="  + eval(entry[0]+"_sel"));
            if (eval(entry[0]+"_sel") === true) {
                //console.log(entry[0] + " is selected");
                sourcesModel.addSource(entry[0], entry[2])
            }
        });
    }

    property bool kotimaa_sel : false;
    property bool ulkomaat_sel : false;
    property bool talous_sel : false;
    property bool it_sel : false;
    property bool media_sel : false;
    property bool politiikka_sel : false;
    property bool kulttuuri_sel : false;
    property bool terveys_sel : false;
    property bool tiede_sel : false;
    property bool luonto_sel : false;
    property bool rikos_sel : false;

    Component.onCompleted: {
        //console.log("onCompleted")

        // Specific news feeds
        settings.createSpecificFeeds();
        var j = 0;
        settings.feeds_specific_news.forEach(function(entry) {
            //console.log("feeds_specific_news=" + entry);
            Qt.createQmlObject('
                import QtQuick 2.1; import Sailfish.Silica 1.0;
                TextSwitch {
                    text: "' + entry[1] + '";
                    onCheckedChanged: {
                        console.log("' + entry[0] + ': " + checked);
                        checked ? ' + entry[0] + '_sel = true : ' + entry[0] + '_sel = false;
                    }
                }',
                newsFeeds, "dynTextSwitch"+ j
            );
            j++;
        });
    }

    Connections {
        target: settings
        onSettingsLoaded: {
            console.log("onSettingsLoaded, feeds_basic_selected=" + settings.feeds_basic_selected)
            switch (settings.feeds_basic_selected) {
                case settings.feeds_basic_news[0][0]:
                    feedModeBox.currentIndex = 0
                    break;
                case settings.feeds_basic_news[1][0]:
                    feedModeBox.currentIndex = 1
                    break;
                case settings.feeds_basic_news[2][0]:
                    feedModeBox.currentIndex = 2
                    break;
                case settings.feeds_basic_news[3][0]:
                    feedModeBox.currentIndex = 3
                    break;
                case settings.feeds_basic_news[4][0]:
                    feedModeBox.currentIndex = 4
                    break;
                case settings.feeds_basic_news[5][0]:
                    feedModeBox.currentIndex = 5
                    break;
                case settings.feeds_basic_news[6][0]:
                    feedModeBox.currentIndex = 6
                    break;
                default:
                    feedModeBox.currentIndex = 0
            }

            console.log("feedModeBox.currentIndex=" + feedModeBox.currentIndex)
        }
    }

}
