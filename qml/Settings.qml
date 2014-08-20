import QtQuick 2.1
import "components/storage.js" as Storage

QtObject {
    id: settings;

    signal settingsLoaded
    signal settingsChanged

    onSettingsLoaded: {
        if (sourcesModel.count === 0) {
            sourcesModel.addSource(feeds_basic[0].id, feeds_basic[0].name, feeds_basic[0].url)
        }

        selectedSection = feeds_basic_selected
        selectedSectionName = feeds_basic_selectedName

        feedModel.refresh()
    }

    // Settings page
    property string feeds_basic_selected : "kaikki";
    property string feeds_basic_selectedName : qsTr("All");

    // Ampparit.com feeds
    property string section_basic : qsTr("Basic news feeds");
    property var feeds_basic : [
        { section: section_basic, id: "kaikki", name: qsTr("All"), url: "http://feeds.feedburner.com/ampparit-kaikki", selected: true },
        { section: section_basic, id: "uutiset", name: qsTr("News"), url: "http://feeds.feedburner.com/ampparit-uutiset", selected: false },
        { section: section_basic, id: "uutiset-viihde", name: qsTr("News and entertainment"), url: "http://feeds.feedburner.com/ampparit-uutiset-viihde", selected: false },
        { section: section_basic, id: "uutiset-urheilu", name: qsTr("News and sports"), url: "http://feeds.feedburner.com/ampparit-uutiset-urheilu", selected: false },
        { section: section_basic, id: "viihde", name: qsTr("Entertainment"), url: "http://feeds.feedburner.com/ampparit-viihde", selected: false },
        { section: section_basic, id: "urheilu", name: qsTr("Sports news"), url: "http://feeds.feedburner.com/ampparit-urheilu", selected: false },
        { section: section_basic, id: "maakunnat", name: qsTr("Province news"), url: "http://feeds.feedburner.com/ampparit-maakunnat", selected: false }
    ];

    // Tarkemmat uutissyötteet
    property string section_news : qsTr("Specific news feeds");
    property var feeds_specific_news : [
        { section: section_news, id: "kotimaa", name: qsTr("National"), url: "http://feeds.feedburner.com/ampparit-kotimaa", selected: false},
        { section: section_news, id: "ulkomaat", name: qsTr("World"), url: "http://feeds.feedburner.com/ampparit-ulkomaat", selected: false},
        { section: section_news, id: "talous", name: qsTr("Finance"), url: "http://feeds.feedburner.com/ampparit-talous", selected: false},
        { section: section_news, id: "it", name: qsTr("IT"), url: "http://feeds.feedburner.com/ampparit-it", selected: false},
        { section: section_news, id: "media", name: qsTr("Media"), url: "http://feeds.feedburner.com/ampparit-media", selected: false},
        { section: section_news, id: "politiikka", name: qsTr("Politics"), url: "http://feeds.feedburner.com/ampparit-politiikka", selected: false},
        { section: section_news, id: "kulttuuri", name: qsTr("Culture"), url: "http://feeds.feedburner.com/ampparit-kulttuuri", selected: false},
        { section: section_news, id: "terveys", name: qsTr("Health and well-being"), url: "http://feeds.feedburner.com/ampparit-terveys-ja-hyvinvointi", selected: false},
        { section: section_news, id: "tiede", name: qsTr("Science and research"), url: "http://feeds.feedburner.com/ampparit-tiede-ja-tutkimus", selected: false},
        { section: section_news, id: "luonto", name: qsTr("Nature and environment"), url: "http://feeds.feedburner.com/ampparit-luonto-ja-ymparisto", selected: false},
        { section: section_news, id: "rikos", name: qsTr("Crime and punishment"), url: "http://feeds.feedburner.com/ampparit-rikos-ja-rangaistus", selected: false}
    ];

    // Tarkemmat viihdesyötteet
    property string section_entertainment : qsTr("Specific entertainment feeds");
    property var feeds_specific_entertainment : [
        { section: section_entertainment, id: "elokuvat", name: qsTr("Movies"), url: "http://feeds.feedburner.com/ampparit-elokuvat", selected: false},
        { section: section_entertainment, id: "televisio", name: qsTr("Television"), url: "http://feeds.feedburner.com/ampparit-televisio", selected: false},
        { section: section_entertainment, id: "musiikki", name: qsTr("Music"), url: "http://feeds.feedburner.com/ampparit-musiikki", selected: false},
        { section: section_entertainment, id: "pelit", name: qsTr("Games"), url: "http://feeds.feedburner.com/ampparit-pelit", selected: false}
    ];

    // Tarkemmat urheilusyötteet
    property string section_sports : qsTr("Specific sports feeds");
    property var feeds_specific_sports : [
        { section: section_sports, id: "jaakiekko", name: qsTr("Hockey"), url: "http://feeds.feedburner.com/ampparit-jaakiekko", selected: false},
        { section: section_sports, id: "jalkapallo", name: qsTr("Football"), url: "http://feeds.feedburner.com/ampparit-jalkapallo", selected: false},
        { section: section_sports, id: "moottoriurheilu", name: qsTr("Motorsports"), url: "http://feeds.feedburner.com/ampparit-moottoriurheilu", selected: false},
        { section: section_sports, id: "formula-1", name: qsTr("Formula 1"), url: "http://feeds.feedburner.com/ampparit-formula-1", selected: false},
        { section: section_sports, id: "talvilajit", name: qsTr("Winter sports"), url: "http://feeds.feedburner.com/ampparit-talvilajit", selected: false},
        { section: section_sports, id: "yleisurheilu", name: qsTr("Track & field"), url: "http://feeds.feedburner.com/ampparit-yleisurheilu", selected: false},
        { section: section_sports, id: "koripallo", name: qsTr("Basketball"), url: "http://feeds.feedburner.com/ampparit-koripallo", selected: false},
        { section: section_sports, id: "lentopallo", name: qsTr("Volleyball"), url: "http://feeds.feedburner.com/ampparit-lentopallo", selected: false},
        { section: section_sports, id: "salibandy", name: qsTr("Floorball"), url: "http://feeds.feedburner.com/ampparit-salibandy", selected: false},
        { section: section_sports, id: "golf", name: qsTr("Golf"), url: "http://feeds.feedburner.com/ampparit-golf", selected: false},
        { section: section_sports, id: "raviurheilu", name: qsTr("Horse racing"), url: "http://feeds.feedburner.com/ampparit-raviurheilu", selected: false},
        { section: section_sports, id: "pesapallo", name: qsTr("Finnish baseball"), url: "http://feeds.feedburner.com/ampparit-pesapallo", selected: false},
        { section: section_sports, id: "muut-lajit", name: qsTr("Other sports"), url: "http://feeds.feedburner.com/ampparit-muut-lajit", selected: false}
    ];

    /*
    Tarkemmat maakuntasyötteet
        Etelä-Pohjanmaa	http://feeds.feedburner.com/ampparit-etela-pohjanmaa
        Kainuu	http://feeds.feedburner.com/ampparit-kainuu
        Kanta-Häme	http://feeds.feedburner.com/ampparit-kanta-hame
        Keski-Suomi	http://feeds.feedburner.com/ampparit-keski-suomi
        Lappi	http://feeds.feedburner.com/ampparit-lappi
        Pirkanmaa	http://feeds.feedburner.com/ampparit-pirkanmaa
        Pohjois-Karjala	http://feeds.feedburner.com/ampparit-pohjois-karjala
        Pohjois-Pohjanmaa	http://feeds.feedburner.com/ampparit-pohjois-pohjanmaa
        Päijät-Häme	http://feeds.feedburner.com/ampparit-paijat-hame
        Uusimaa	http://feeds.feedburner.com/ampparit-uusimaa
        Varsinais-Suomi	http://feeds.feedburner.com/ampparit-varsinais-suomi
    */

    // Muut syötteet
    property string section_other : qsTr("Other feeds");
    property var feeds_specific_others : [
        { section: section_other, id: "autot-ja-liikenne", name: "Cars and traffic", url: "http://feeds.feedburner.com/ampparit-autot-ja-liikenne", selected: false},
         { section: section_other, id: "matkailu", name: "Traveling", url: "http://feeds.feedburner.com/ampparit-matkailu", selected: false},
         { section: section_other, id: "ruoka-ja-juoma", name: "Food and drinks", url: "http://feeds.feedburner.com/ampparit-ruoka-ja-juoma", selected: false},
         { section: section_other, id: "koti-ja-rakentaminen", name: "Home and building", url: "http://feeds.feedburner.com/ampparit-koti-ja-rakentaminen", selected: false},
         { section: section_other, id: "apple", name: "Apple", url: "http://feeds.feedburner.com/ampparit-apple", selected: false},
         { section: section_other, id: "tietoturva", name: "Information security", url: "http://feeds.feedburner.com/ampparit-tietoturva", selected: false},
         { section: section_other, id: "paakirjoitukset", name: "Editorials", url: "http://feeds.feedburner.com/ampparit-paakirjoitukset", selected: false},
         { section: section_other, id: "pokeri", name: "Poker", url: "http://feeds.feedburner.com/ampparit-pokeri", selected: false}
    ];

    function loadFeedSettings() {
        //console.debug("loadFeedSettings()")

        sourcesModel.clear()
        specificFeedsModel.clear()

        // Adding All as it's always selected
        sourcesModel.addSource(feeds_basic[0].id, feeds_basic[0].name, feeds_basic[0].url)
        Storage.writeSetting("kaikki", true)

        specificFeedsModel.append(feeds_basic)
        specificFeedsModel.append(feeds_specific_news)
        specificFeedsModel.append(feeds_specific_sports)
        specificFeedsModel.append(feeds_specific_entertainment)
        specificFeedsModel.append(feeds_specific_others)

        // Selecting specific feeds if they're selected in settings
        for (var i=0; i < specificFeedsModel.count; i++) {
            var entry = specificFeedsModel.get(i)
            Storage.readSetting(entry.id,
                function(selected) {
                    entry.selected = selected;
                    if (selected && entry.id.toString() !== "kaikki") {
                        sourcesModel.addSource(entry.id, entry.name, entry.url)
                    }
                }
            );
        };

        //console.log(JSON.stringify(feeds_specific));

        settingsLoaded();
    }

    function saveFeedSettings() {
        for (var i=0; i < specificFeedsModel.count; i++) {
            var entry = specificFeedsModel.get(i);
            Storage.writeSetting(entry.id, entry.selected);
        };

        settingsChanged();
    }

}
