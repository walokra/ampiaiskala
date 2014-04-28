import QtQuick 2.1
import "components/storage.js" as Storage

QtObject {
    id: settings;

    signal settingsLoaded

    // Settings page
    property string feeds_basic_selected : "kaikki"

    // Ampparit.com feeds
    property var feeds_basic_news : [];
    function createBasicFeeds() {
        feeds_basic_news.push(["kaikki", "Kaikki", "http://feeds.feedburner.com/ampparit-kaikki"])
        feeds_basic_news.push(["uutiset", "Uutiset", "http://feeds.feedburner.com/ampparit-uutiset"])
        feeds_basic_news.push(["uutiset-viihde", "Uutiset ja viihde", "http://feeds.feedburner.com/ampparit-uutiset-viihde"])
        feeds_basic_news.push(["uutiset-urheilu", "Uutiset ja urheilu", "http://feeds.feedburner.com/ampparit-uutiset-urheilu"])
        feeds_basic_news.push(["viihde", "Viihdeuutiset", "http://feeds.feedburner.com/ampparit-viihde"])
        feeds_basic_news.push(["urheilu", "Urheilu-uutiset", "http://feeds.feedburner.com/ampparit-urheilu"])
        feeds_basic_news.push(["maakunnat", "Maakunta-uutiset", "http://feeds.feedburner.com/ampparit-maakunnat"])
    }

    // Tarkemmat uutissyötteet
    property var feeds_specific_news : [];
    function createSpecificFeeds() {
        feeds_specific_news.push(["kotimaa", "Kotimaa",  "http://feeds.feedburner.com/ampparit-kotimaa"])
        feeds_specific_news.push(["ulkomaat", "Ulkomaat",  "http://feeds.feedburner.com/ampparit-ulkomaat"])
        feeds_specific_news.push(["talous", "Talous", "http://feeds.feedburner.com/ampparit-talous"])
        feeds_specific_news.push(["it", "IT", "http://feeds.feedburner.com/ampparit-it"])
        feeds_specific_news.push(["media", "Media", "http://feeds.feedburner.com/ampparit-media"])
        feeds_specific_news.push(["politiikka", "Politiikka", "http://feeds.feedburner.com/ampparit-politiikka"])
        feeds_specific_news.push(["kulttuuri", "Kulttuuri", "http://feeds.feedburner.com/ampparit-kulttuuri"])
        feeds_specific_news.push(["terveys", "Terveys ja hyvinvointi", "http://feeds.feedburner.com/ampparit-terveys-ja-hyvinvointi"])
        feeds_specific_news.push(["tiede", "Tiede ja tutkimus", "http://feeds.feedburner.com/ampparit-tiede-ja-tutkimus"])
        feeds_specific_news.push(["luonto", "Luonto ja ympäristö", "http://feeds.feedburner.com/ampparit-luonto-ja-ymparisto"])
        feeds_specific_news.push(["rikos", "Rikos ja rangaistus", "http://feeds.feedburner.com/ampparit-rikos-ja-rangaistus"])
    }

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
        feeds_basic_selected = Storage.readSetting("feeds_basic_selected");

        settingsLoaded();
    }

    function saveFeedSettings() {
        Storage.writeSetting("feeds_basic_selected", feeds_basic_selected);
    }
}
