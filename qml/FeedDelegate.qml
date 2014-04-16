import QtQuick 2.1
import Sailfish.Silica 1.0

ListItem {
    id: root

    property alias title: title.text
    property alias updated: updated.text
    property alias link: link.text

    Feed {
        id: feed
    }

    Row {
        id: row

        spacing: Theme.paddingLarge
        anchors { verticalCenter: parent.verticalCenter; left: parent.left; right: parent.right; margins: Theme.paddingLarge }

        Column {
            id: column
            spacing: Theme.paddingSmall
            width: parent.width
            baselineOffset: title.baselineOffset

            Label {
                id: title
                width: parent.width
                font.pixelSize: Theme.fontSizeMedium
                color: Theme.primaryColor
                textFormat: Text.PlainText
                elide: Text.ElideRight
            }

            Label {
                id: updated
                width: parent.width
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
                textFormat: Text.PlainText
                elide: Text.ElideRight
            }

            Label {
                id: link
                width: parent.width
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.secondaryColor
                textFormat: Text.PlainText
                elide: Text.ElideRight
            }
        }
    }
}
