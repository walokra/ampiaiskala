import QtQuick 2.1
import Sailfish.Silica 1.0

Item {
    property SilicaListView flickable: parent
    property PullDownMenu pullDownMenu: pullDownMenu

    // Timer for top/bottom buttons
    Timer {
        id: idle;
        property bool moving: flickable.moving || flickable.dragging || flickable.flicking;
        property bool menuOpen: pullDownMenu.active;
        onMovingChanged: if (!moving && !menuOpen) restart();
        interval: flickable.atYBeginning || flickable.atYEnd ? 300 : 2000;
    }

    // to top button
    Rectangle {
        visible: opacity > 0;
        width: 64;
        height: 64;
        anchors { top: parent.top; right: parent.right; margins: Theme.paddingLarge; }
        radius: 75;
        color: Theme.highlightBackgroundColor;
        opacity: (idle.moving || idle.running) && !idle.menuOpen ? 1 : 0;
        Behavior on opacity { FadeAnimation { duration: 300; } }

        IconButton {
            anchors.centerIn: parent;
            icon.source: "image://theme/icon-l-up";
            onClicked: {
                flickable.cancelFlick();
                flickable.scrollToTop();
            }
        }
    }

    // to bottom button
    Rectangle {
        visible: opacity > 0;
        width: 64;
        height: 64;
        anchors { bottom: parent.bottom; right: parent.right; margins: Theme.paddingLarge; }
        radius: 75;
        color: Theme.highlightBackgroundColor;
        opacity: (idle.moving || idle.running) && !idle.menuOpen ? 1 : 0;
        Behavior on opacity { FadeAnimation { duration: 300; } }

        IconButton {
            anchors.centerIn: parent;
            icon.source: "image://theme/icon-l-down";
            onClicked: {
                flickable.cancelFlick();
                flickable.scrollToBottom();
            }
        }
    }

}
