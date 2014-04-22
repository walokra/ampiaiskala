import QtQuick 2.1

ListModel {

    signal modelChanged

    function addSource(name, url) {
        append({
                   "sourceId": name,
                   "name": name,
                   "url": url
               });

        modelChanged();
    }

    function changeSource(sourceId, name, url) {
        for (var i = 0; i < count; i++) {
            if (get(i).sourceId === sourceId) {
                get(i).name = name;
                get(i).url = url;
                break;
            }
        }

        modelChanged();
    }

    function removeSource(sourceId) {
        for (var i = 0; i < count; i++) {
            if (get(i).sourceId === sourceId) {
                remove(i);
                break;
            }
        }

        modelChanged();
    }

    Component.onCompleted: {
        append({
                   "sourceId": "kaikki",
                   "name": "kaikki",
                   "url": "http://feeds.feedburner.com/ampparit-kaikki"
               });

        modelChanged();
    }

}
