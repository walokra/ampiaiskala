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
                        "url": get(i).url
                    };
                    sources.push(data);
                }
                feedModel.sources = sources;
            }

            Component.onCompleted: {
            }
        }

    FeedModel {
        id: feedModel

        onError: {
            console.log("Error: " + details);
        }
    }

    initialPage: mainPageComponent

    Component {
        id: mainPageComponent
        MainPage { }
    }

    Settings { id: settings }

    Constants { id: constants }
}


