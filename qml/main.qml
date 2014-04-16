import QtQuick 2.1
import Sailfish.Silica 1.0

ApplicationWindow
{
    initialPage: mainPageComponent

    Component {
        id: mainPageComponent
        MainPage { }
    }

    FeedManager {
            id: feedManager
    }

    Settings { id: settings }

    Constants { id: constants }
}


