import QtQuick 2.1
import Sailfish.Silica 1.0

ApplicationWindow
{
    SourcesModel {
        id: sourcesModel

        onModelChanged: {
            var sources = [];
            for (var i = 0; i < count; i++) {
                var data = {
                    "name": get(i).name,
                    "url": get(i).url,
                };
                sources.push(data);
            }
            feedModel.sources = sources;
        }

        Component.onCompleted: {
            if (count === 0) {
                sourcesModel.addSource("kaikki", "http://feeds.feedburner.com/ampparit-kaikki")
            }
        }
    }

    FeedModel {
        id: feedModel

        onError: {
            console.log("Error: " + details);
        }
    }

    initialPage: mainPageComponent
    cover: Qt.resolvedUrl("CoverPage.qml")

    QtObject {
        id: coverAdaptor

        signal refresh
        signal abort
    }

    Component {
        id: mainPageComponent
        MainPage { }
    }

    AboutPage { id: aboutPage; }

    FeedsPage { id: feedsPage; }

    Settings { id: settings }

    Constants { id: constants }

    Component.onCompleted: {
        settings.loadFeedSettings();
    }
}
