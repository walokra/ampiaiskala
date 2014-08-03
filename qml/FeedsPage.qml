import QtQuick 2.1
import Sailfish.Silica 1.0

Dialog {
    id: feedsPage

    allowedOrientations: Orientation.All

    property string selectedId : ""
    property string selectedUrl : ""
    property string selectedName : ""

    Connections {
        target: settings

        onSettingsLoaded: {
            listView.model = specificFeedsModel;

            selectedId = settings.feeds_basic_selected
            selectedUrl = settings.feeds_basic_selectedUrl
            selectedName = settings.feeds_basic_selectedName
        }
    }

    SilicaFlickable {
        id: flickable;

        anchors.fill: parent;

        DialogHeader {
            id: header;
            title: qsTr("Feeds");
            acceptText: qsTr("Save");
        }

        //contentHeight: contentArea.height + listView.height + 100;

        Column {
            id: contentArea;
            anchors { top: header.bottom; left: parent.left; right: parent.right }
            width: parent.width

            anchors.leftMargin: constants.paddingMedium
            anchors.rightMargin: constants.paddingMedium

            ComboBox {
                id: feedModeBox
                currentIndex: 0
                width: parent.width

                label: qsTr("Basic feed") + ":"

                menu: ContextMenu {
                    id: feedMenu

                    Repeater {
                         width: parent.width
                         model: settings.feeds_basic

                         delegate: MenuItem {
                             text: modelData.name
                             onClicked: {
                                 //console.log("onClicked: " + index + "; id=" + modelData.id)
                                 selectedId = modelData.id
                                 selectedName = modelData.name
                                 selectedUrl = modelData.url
                             }
                         }
                    }
                    //onActiveChanged: {
                    //    console.log("onActiveChanged, index: " + feedModeBox.currentIndex)
                    //}
                }
                onCurrentIndexChanged: {
                    selectedId = settings.feeds_basic[currentIndex].id
                    selectedName = settings.feeds_basic[currentIndex].name
                    selectedUrl = settings.feeds_basic[currentIndex].url
                    //console.debug("onCurrentIndexChanged("+ currentIndex +"): selectedId= " + selectedId + "; selectedUrl=" + selectedUrl)
                }
            }
        }

        // The delegate for each section header
        Component {
            id: sectionHeading
            SectionHeader { text: section }
        }

        SilicaListView {
            id: listView

            anchors { top: contentArea.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }
            anchors.margins: constants.paddingSmall;
            height: childrenRect.height;

            pressDelay: 0;
            clip: true;

            model: specificFeedsModel;

            section.property: "section"
            section.criteria: ViewSection.FullString
            section.delegate: sectionHeading

            delegate: Column {
                id: delegate;
                width: listView.width;
                spacing: constants.paddingSmall;
                height: txtSwitch.height;

                TextSwitch {
                    id: txtSwitch
                    text: name
                    checked: selected
                    onCheckedChanged: {
                        //console.debug("onCheckedChanged, id=" + modelData.id)
                        checked ? addFeed(id) : removeFeed(id);
                    }
                }
            }
            VerticalScrollDecorator { flickable: listView }
        }

    }

    function addFeed(id) {
        //console.debug("addFeed: " + id)
        //settings.feeds_specific.forEach(function(entry) {
        for (var i=0; i < specificFeedsModel.count; i++) {
            var entry = specificFeedsModel.get(i);
            if (entry.id === id) {
                entry.selected = true;
            }
        };
    }

    function removeFeed(id) {
        //console.debug("removeFeed: " + id)
        for (var i=0; i < specificFeedsModel.count; i++) {
            var entry = specificFeedsModel.get(i);
            if (entry.id === id) {
                entry.selected = false;
            }
        };
    }

    onAccepted: {
        sourcesModel.clear();

        if (selectedId && selectedId != "none") {
            settings.feeds_basic_selected = selectedId;
            sourcesModel.addSource(selectedId, selectedName, selectedUrl);
            settings.feeds_basic_selectedName = selectedName;
        }

        // Check which specific feeds are selected and add them to source
        for (var i=0; i < specificFeedsModel.count; i++) {
            var entry = specificFeedsModel.get(i);
            if (entry.selected === true) {
                //console.debug("specific selected, " + entry.id + "; "+ entry.selected)
                sourcesModel.addSource(entry.id, entry.name, entry.url)
            }
        };

        settings.saveFeedSettings();
    }

    Component.onCompleted: {
        //console.debug("FeedsPage.onCompleted, feeds_basic_selected=" + settings.feeds_basic_selected)
        // Setting the current value for combobox
        switch (settings.feeds_basic_selected) {
            case settings.feeds_basic[0].id:
                feedModeBox.currentIndex = 0
                break;
            case settings.feeds_basic[1].id:
                feedModeBox.currentIndex = 1
                break;
            case settings.feeds_basic[2].id:
                feedModeBox.currentIndex = 2
                break;
            case settings.feeds_basic[3].id:
                feedModeBox.currentIndex = 3
                break;
            case settings.feeds_basic[4].id:
                feedModeBox.currentIndex = 4
                break;
            case settings.feeds_basic[5].id:
                feedModeBox.currentIndex = 5
                break;
            case settings.feeds_basic[6].id:
                feedModeBox.currentIndex = 6
                break;
            default:
                feedModeBox.currentIndex = 1
        }
        //console.debug("feedModeBox.currentIndex=" + feedModeBox.currentIndex)
    }

}
