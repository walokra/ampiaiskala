import QtQuick 2.1
import QtQuick.XmlListModel 2.0

XmlListModel {
    query: "/atom:feed/atom:entry"
    namespaceDeclarations: "declare namespace atom = 'http://www.w3.org/2005/Atom';"

    XmlRole { name: "title"; query: "atom:title/string()" }
    XmlRole { name: "updated"; query: "atom:updated/string()" }
    XmlRole { name: "link"; query: "atom:id/string()" }

}
