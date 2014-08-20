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

        // The delegate for each section header
        Component {
            id: sectionHeading
            SectionHeader { text: section }
        }

        SilicaListView {
            id: listView

            anchors { top: header.bottom; left: parent.left; right: parent.right; bottom: parent.bottom }
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
                    enabled: (id === "kaikki") ? false : true
                    checked: (id === "kaikki") ? true : selected
                    onCheckedChanged: {
                        checked ? addFeed(id) : removeFeed(id);
                    }
                }
            }
            VerticalScrollDecorator { flickable: listView }
        }

    }

    function addFeed(id) {
        //console.debug("addFeed: " + id)
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
                sourcesModel.addSource(entry.id, entry.name, entry.url)
            }
        };

        settings.saveFeedSettings();
    }

    Component.onCompleted: {

    }

}
