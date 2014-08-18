import QtQuick 2.0
import Sailfish.Silica 1.0
import "components/utils.js" as Utils

Panel {
    id: feedPanel;

    signal clicked();

    Connections {
        target: settings

        onSettingsLoaded: {
            filteredFeedRepeater.model = specificFeedsModel;
        }
    }

    Connections {
        target: settings

        onSettingsChanged: {
            filteredFeedRepeater.model = specificFeedsModel;
        }
    }

    SilicaFlickable {
        pressDelay: 0;

        anchors.fill: parent;
        contentHeight: contentArea.height;

        Column {
            id: contentArea;
            width: parent.width;
            height: childrenRect.height;

            anchors { left: parent.left; right: parent.right; margins: Theme.paddingLarge; }
            spacing: constants.paddingLarge;

            Repeater {
                id: filteredFeedRepeater
                width: parent.width
                model: specificFeedsModel

                delegate: BackgroundItem {
                    id: filteredFeedItem;
                    visible: selected;

                    Label {
                        anchors { left: parent.left; right: parent.right; }
                        anchors.verticalCenter: parent.verticalCenter;
                        text: name;
                        font.pixelSize: constants.fontSizeMedium;
                        color: filteredFeedItem.highlighted ? constants.colorHighlight : constants.colorPrimary;
                    }

                    onClicked: {
                        newsModel.clear();
                        selectedSection = id;
                        selectedSectionName = name;
                        //console.debug("Showing feed: " + selectedSection + "; " + selectedSectionName);

                        feedModel.refresh();

                        //console.log("newsModel.count: " + newsModel.count);
                        viewer.hidePanel();
                    }
                }
            }
        }

        VerticalScrollDecorator { }
    }

    onClicked: {
        viewer.hidePanel();
    }

}
