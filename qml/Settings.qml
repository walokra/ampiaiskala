import QtQuick 2.1

QtObject {
    id: settings;

    signal settingsLoaded;

    // Settings page

    // Ampparit.com feeds
    property bool feeds_kaikki : true
    property string feeds_kaikki_id : "Kaikki"
    property string feeds_kaikki_url: "http://feeds.feedburner.com/ampparit-kaikki"

    property bool feeds_uutiset : false
    property string feeds_uutiset_id : "Uutiset"
    property string feeds_uutiset_url : "http://feeds.feedburner.com/ampparit-uutiset"

    property bool feeds_uutiset_viihde : false
    property string feeds_uutiset_viihde_id : "Uutiset ja viihde"
    property string feeds_uutiset_viihde_url : "http://feeds.feedburner.com/ampparit-uutiset-viihde"

    property bool feeds_uutiset_urheilu : false
    property string feeds_uutiset_urheilu_id : "Uutiset ja urheilu"
    property string feeds_uutiset_urheilu_url : "http://feeds.feedburner.com/ampparit-uutiset-urheilu"

    property bool feeds_viihdeuutiset : false
    property string feeds_viihdeuutiset_id : "Viihdeuutiset"
    property string feeds_viihdeuutiset_url : "http://feeds.feedburner.com/ampparit-viihde"

    property bool feeds_urheiluuutiset : false
    property string feeds_urheiluuutiset_id : "Urheiluu-utiset"
    property string feeds_urheiluuutiset_url : "http://feeds.feedburner.com/ampparit-urheilu"

    property bool feeds_maakuntauutiset : false
    property string feeds_maakunta_uutiset_id : "Maakunta-uutiset"
    property string feeds_maakunta_uutiset_url : "http://feeds.feedburner.com/ampparit-maakunnat"

    // Tarkemmat uutissyötteet
    /*
    Kotimaa	http://feeds.feedburner.com/ampparit-kotimaa
    Ulkomaat	http://feeds.feedburner.com/ampparit-ulkomaat
    Talous	http://feeds.feedburner.com/ampparit-talous
    IT	http://feeds.feedburner.com/ampparit-it
    Media	http://feeds.feedburner.com/ampparit-media
    Politiikka	http://feeds.feedburner.com/ampparit-politiikka
    Kulttuuri	http://feeds.feedburner.com/ampparit-kulttuuri
    Terveys ja hyvinvointi	http://feeds.feedburner.com/ampparit-terveys-ja-hyvinvointi
    Tiede ja tutkimus	http://feeds.feedburner.com/ampparit-tiede-ja-tutkimus
    Luonto ja ympäristö	http://feeds.feedburner.com/ampparit-luonto-ja-ymparisto
    Rikos ja rangaistus	http://feeds.feedburner.com/ampparit-rikos-ja-rangaistus
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
}
