import QtQuick 2.0

ListModel {

    signal modelChanged

    Component.onCompleted: {
        append({
                   "sourceId": "kaikki",
                   "name": "kaikki",
                   "url": "http://feeds.feedburner.com/ampparit-kaikki"
               });

        /*
        append({
                   "sourceId": "uutiset",
                   "name": "uutiset",
                   "url": "http://feeds.feedburner.com/ampparit-uutiset"
               });
        */
        modelChanged();
    }

}
