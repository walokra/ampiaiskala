import QtQuick 2.1

ListModel {

    signal modelChanged

    function addSource(name, url) {
        console.log("addSource: " + name + ", " + url)
        append({
            "name": name,
            "url": url
        });

        /*
        switch (id) {
            case settings.feeds_kaikki_id:
                append({
                    "id": settings.feeds_kaikki_id,
                    "name": settings.feeds_kaikki_name,
                    "url": settings.feeds_kaikki_url
                });
                break;
            case settings.feeds_uutiset_id:
                append({
                    "id": settings.feeds_uutiset_id,
                    "name": settings.feeds_uutiset_name,
                    "url": settings.feeds_uutiset_url
                });
                break;
            case settings.feeds_uutiset_viihde_id:
                append({
                    "id": settings.feeds_uutiset_viihde_id,
                    "name": settings.feeds_uutiset_viihde_name,
                    "url": settings.feeds_uutiset_viihde_url
                });
                break;
            case settings.feeds_uutiset_urheilu_id:
                append({
                    "id": settings.feeds_uutiset_urheilu_id,
                    "name": settings.feeds_uutiset_urheilu_name,
                    "url": settings.feeds_uutiset_urheilu_url
                });
                break;
            case settings.feeds_viihde_id:
                append({
                    "id": settings.feeds_viihde_id,
                    "name": settings.feeds_viihde_name,
                    "url": settings.feeds_viihde_url
                });
                break;
            case settings.feeds_urheilu_id:
                append({
                    "id": settings.feeds_urheilu_id,
                    "name": settings.feeds_urheilu_name,
                    "url": settings.feeds_urheilu_url
                });
                break;
            case settings.feeds_maakunnat_id:
                append({
                    "id": settings.feeds_maakunnat_id,
                    "name": settings.feeds_maakunnat_name,
                    "url": settings.feeds_maakunnat_url
                });
                break;
        }
        */

        modelChanged();
    }

}
