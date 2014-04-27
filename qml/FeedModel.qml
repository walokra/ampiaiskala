import QtQuick 2.1
import QtQuick.XmlListModel 2.0
import Sailfish.Silica 1.0
import harbour.ampiaiskala 1.0

ListModel {
    id: listModel

    signal error(string details)

    property variant sources: []

    // the time of the last refresh
    property variant lastRefresh

    // flag indicating that this model is busy
    property bool busy: false

    // name of the feed currently loading
    property string currentlyLoading

    // private list of items as JS dicts
    property var _items: []

    property variant _models: [ _atomModel ]

    property variant _sourcesQueue: []

    property FeedLoader _feedLoader: FeedLoader {
        property string feedName

        onSuccess: {
            switch (type) {
                case FeedLoader.Atom:
                    _atomModel.xml = "";
                    _atomModel.xml = data;
                    break;
                default:
                    _handleError("Unsupported feed format.");
                    break;
            }
        }

        onError: {
            console.log("onError")
            _handleError(details);
        }
    }

    property Timer _itemLoader: Timer {
        property variant model
        property int index

        function load(loadModel) {
            model = loadModel;
            index = 0;
            start();
        }

        interval: 75
        repeat: true

        onTriggered: {
            for (var end = index + 2; index < end && index < model.count; index++) {
                listModel._loadItem(model, index);
                index++;
            }

            if (index >= model.count) {
                stop();
                _loadNext();
            }
        }
    }

    property AtomModel _atomModel: AtomModel {
        onStatusChanged: {
            //console.log("AtomModel.status = " + status);

            if (status === XmlListModel.Error) {
                _handleError(errorString());
            } else if (status === XmlListModel.Ready) {
                _itemLoader.load(_atomModel);
            }
        }
    }

    /*
     * Clears and reloads the model from the current sources.
     */
    function refresh() {
        console.log("Refreshing model");
        busy = true;
        clear();
        for (var i = 0; i < sources.length; i++) {
            console.log("Source: " + sources[i].url);
        }
        _sourcesQueue = sources;
        _loadNext();
        lastRefresh = new Date();
    }

    /* Aborts loading.
     */
    function abort() {
        _sourcesQueue = [];
        _itemLoader.stop();
        busy = false;
    }

    /*
     * Takes the next source from the sources queue and loads it.
     */
    function _loadNext() {
        var queue = _sourcesQueue;
        if (queue.length > 0) {
            var source = queue.pop();
            var name = source.name;
            var url = source.url;

            console.log("Now loading: " + name);
            currentlyLoading = name;
            _feedLoader.feedName = name;
            _feedLoader.source = url;

            _sourcesQueue = queue;
        } else {
            busy = false;
            currentlyLoading = "";
        }
    }

    /*
     * Adds the item from the given model.
     */
    function _loadItem(model, i) {
        var item = _createItem(model.get(i));
        item["source"] = "" + _feedLoader.source; // convert to string
        item["date"] = item.dateString !== "" ? new Date(item.dateString) : new Date();
        item["name"] = _feedLoader.feedName;

        _items.push(item);
        append(item);
    }

    function _createItem(obj) {
        var item = { };
        for (var key in obj) {
            item[key] = obj[key];
        }
        return item;
    }

    function _handleError(error) {
        console.log(error);

        var feedName = currentlyLoading + "";
        if (error.substring(0, 5) === "Host ") {
            // Host ... not found
            listModel.error(qsTr("Error with %1:\n%2").arg(feedName).arg(error));
        } else if (error.indexOf(" - server replied: ") !== -1) {
            var idx = error.indexOf(" - server replied: ");
            var reply = error.substring(idx + 19);
            listModel.error(qsTr("Error with %1:\n%2").arg(feedName).arg(reply));
        } else {
            listModel.error(qsTr("Error with %1:\n%2").arg(feedName).arg(error));
        }
    }

}
