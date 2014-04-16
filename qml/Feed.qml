import QtQuick 2.0

import QtQuick 2.1

QtObject {
    id: root

    property string feedName
    property string name

    property string error
    property bool empty: true
    property bool loading: true
    property bool fetchFeed: false

    function setData(data, ready) {
        if (error && ready) {
            error = "";
        }
        empty = false;
        loading = ready;
        for (var prop in data) {
            root[prop] = data[prop];
        }
    }

    Component.onCompleted: {
        if (fetchFeed) {
            feedManager.fetchFeed(root);
        }

        if (!feedManager) {
            console.debug("WARNING Show.onCompleted: no FeedManager instance")
        }
    }

    Component.onDestruction: {
    }
}
