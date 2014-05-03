import QtQuick 2.1
import "components/storage.js" as Storage

QtObject {
    id: settings;

    signal settingsLoaded

    // Settings page
    property string feeds_basic_selected : "kaikki"

    // Ampparit.com feeds
    property var feeds_basic_news : [
        {id: "none", name: "Ei valittu", url: ""},
        {id: "kaikki", name: "Kaikki", url: "http://feeds.feedburner.com/ampparit-kaikki"},
        {id: "uutiset", name: "Uutiset", url: "http://feeds.feedburner.com/ampparit-uutiset"},
        {id: "uutiset-viihde", name: "Uutiset ja viihde", url: "http://feeds.feedburner.com/ampparit-uutiset-viihde"},
        {id: "uutiset-urheilu", name: "Uutiset ja urheilu", url: "http://feeds.feedburner.com/ampparit-uutiset-urheilu"},
        {id: "viihde", name: "Viihdeuutiset", url: "http://feeds.feedburner.com/ampparit-viihde"},
        {id: "urheilu", name: "Urheilu-uutiset", url: "http://feeds.feedburner.com/ampparit-urheilu"},
        {id: "maakunnat", name: "Maakunta-uutiset", url: "http://feeds.feedburner.com/ampparit-maakunnat"}
    ];

    // Tarkemmat uutissyötteet
    property var feeds_specific_news : [
        { id: "kotimaa", name: "Kotimaa", url: "http://feeds.feedburner.com/ampparit-kotimaa", selected: false},
        { id: "ulkomaat", name: "Ulkomaat", url: "http://feeds.feedburner.com/ampparit-ulkomaat", selected: false},
        { id: "talous", name: "Talous", url: "http://feeds.feedburner.com/ampparit-talous", selected: false},
        { id: "it", name: "IT", url: "http://feeds.feedburner.com/ampparit-it", selected: false},
        { id: "media", name: "Media", url: "http://feeds.feedburner.com/ampparit-media", selected: false},
        { id: "politiikka", name: "Politiikka", url: "http://feeds.feedburner.com/ampparit-politiikka", selected: false},
        { id: "kulttuuri", name: "Kulttuuri", url: "http://feeds.feedburner.com/ampparit-kulttuuri", selected: false},
        { id: "terveys", name: "Terveys ja hyvinvointi", url: "http://feeds.feedburner.com/ampparit-terveys-ja-hyvinvointi", selected: false},
        { id: "tiede", name: "Tiede ja tutkimus", url: "http://feeds.feedburner.com/ampparit-tiede-ja-tutkimus", selected: false},
        { id: "luonto", name: "Luonto ja ympäristö", url: "http://feeds.feedburner.com/ampparit-luonto-ja-ymparisto", selected: false},
        { id: "rikos", name: "Rikos ja rangaistus", url: "http://feeds.feedburner.com/ampparit-rikos-ja-rangaistus", selected: false}
    ];

    /*
    Tarkemmat viihdesyötteet
        Big Brother	http://feeds.feedburner.com/ampparit-big-brother
        Jutut ja juorut	http://feeds.feedburner.com/ampparit-jutut-ja-juorut
        Elokuvat	http://feeds.feedburner.com/ampparit-elokuvat
        Televisio	http://feeds.feedburner.com/ampparit-televisio
        Musiikki	http://feeds.feedburner.com/ampparit-musiikki
        Pelit	http://feeds.feedburner.com/ampparit-pelit


    Tarkemmat urheilusyötteet
        Jääkiekko	http://feeds.feedburner.com/ampparit-jaakiekko
        Jalkapallo	http://feeds.feedburner.com/ampparit-jalkapallo
        Moottoriurheilu	http://feeds.feedburner.com/ampparit-moottoriurheilu
        Formula 1	http://feeds.feedburner.com/ampparit-formula-1
        Talvilajit	http://feeds.feedburner.com/ampparit-talvilajit
        Yleisurheilu	http://feeds.feedburner.com/ampparit-yleisurheilu
        Koripallo	http://feeds.feedburner.com/ampparit-koripallo
        Lentopallo	http://feeds.feedburner.com/ampparit-lentopallo
        Salibandy	http://feeds.feedburner.com/ampparit-salibandy
        Golf	http://feeds.feedburner.com/ampparit-golf
        Raviurheilu	http://feeds.feedburner.com/ampparit-raviurheilu
        Pesäpallo	http://feeds.feedburner.com/ampparit-pesapallo
        Muut lajit	http://feeds.feedburner.com/ampparit-muut-lajit

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

    Muut syötteet
        Autot ja liikenne	http://feeds.feedburner.com/ampparit-autot-ja-liikenne
        Matkailu	http://feeds.feedburner.com/ampparit-matkailu
        Pääkirjoitukset	http://feeds.feedburner.com/ampparit-paakirjoitukset
        Ruoka ja juoma	http://feeds.feedburner.com/ampparit-ruoka-ja-juoma
        Koti ja rakentaminen	http://feeds.feedburner.com/ampparit-koti-ja-rakentaminen
        Pokeri	http://feeds.feedburner.com/ampparit-pokeri
        Apple	http://feeds.feedburner.com/ampparit-apple
        Tietoturva	http://feeds.feedburner.com/ampparit-tietoturva
    */

    function loadFeedSettings() {
        // Selecting basic feed if it's selected in settings
        feeds_basic_selected = Storage.readSetting("feeds_basic_selected");
        if (feeds_basic_selected && feeds_basic_selected != "none") {
            feeds_basic_news.forEach(function(entry) {
                if (entry.id === feeds_basic_selected) {
                    sourcesModel.addSource(entry.id, entry.name, entry.url)
                }
            });
        }
        // Selecting specific feeds if they're selected in settings
        feeds_specific_news.forEach(function(entry) {
            entry.selected = Storage.readSetting(entry.id);
            if (entry.selected) {
                sourcesModel.addSource(entry.id, entry.name, entry.url)
            }
        });

        /*
        feeds_specific_news.forEach(function(entry) {
            console.debug(entry.id +"; " + entry.selected)
        });
        */

        settingsLoaded();
    }

    function saveFeedSettings() {
        Storage.writeSetting("feeds_basic_selected", feeds_basic_selected);

        feeds_specific_news.forEach(function(entry) {
            Storage.writeSetting(entry.id, entry.selected);
        });
    }
}
