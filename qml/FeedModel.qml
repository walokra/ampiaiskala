import QtQuick 2.1
import QtQuick.XmlListModel 2.0

XmlListModel {
    id: root

    property string feedName

    source: feedName.length ? "http://feeds.feedburner.com/ampparit-" + feedName : "kaikki"

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "updated"; query: "updated/string()" }
    XmlRole { name: "link"; query: "id/string()" }

}
