import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

enum TypeMap {
  osm,
  osmHot,
  osmFr,
  cartoMapPositron,
  cartoMapDark,
  stamenTerrain,
  stamenToner,
  stamenWater,
  google,
  googleHybrid,
  googleSatellite,
  esriSatellite,
  esriStreets,
  esriTopo,
}

// ignore: must_be_immutable
class SimpleTilesMap extends StatelessWidget {
  final TypeMap typeMap;
  MapOptions mOpts;
  LatLng? mapCenter;
  String? attrib;
  double? initialZoom;
  MapController? mapController;
  List<Widget>? otherLayers;
  double? minZoom;
  double? maxZoom;

  SimpleTilesMap(
      {Key? key,
      required this.typeMap,
      required this.mOpts,
      this.mapCenter,
      this.attrib,
      this.otherLayers,
      this.mapController,
      this.initialZoom,
      this.minZoom,
      this.maxZoom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    mapCenter = mapCenter ?? LatLng(-16.480954, -68.189594);
    otherLayers = otherLayers ?? [];
    mapController = mapController ?? MapController();
    initialZoom = initialZoom ?? 12;
    attrib = attrib ?? '| Simple Tiles Map';
    minZoom = minZoom ?? 5;
    maxZoom = maxZoom ?? 22;
    return addBaseLayer();
  }

  Widget addBaseLayer() {
    List<Widget> listLayers = [];

    listLayers.add(
      TileLayer(
        urlTemplate: _setTypeMap(typeMap),
        subdomains: _getSubdomains(typeMap),
      ),
    );
    for (var l in otherLayers!) {
      listLayers.add(l);
    }

    return Flexible(
      child: FlutterMap(
        mapController: mapController,
        options: mOpts,
        nonRotatedChildren: [
          Atribuciones.defaultWidget(
            source: attrib.toString(),
            typeMap: typeMap,
            onSourceTapped: () {},
          )
        ],
        children: listLayers,
      ),
    );
  }

  String? _setTypeMap(TypeMap t) {
    String urlTileProvider = "";
    switch (t) {
      case TypeMap.google:
        urlTileProvider = TileProviders.urlGoogle;
        break;
      case TypeMap.googleSatellite:
        urlTileProvider = TileProviders.urlGoogleSatellite;
        break;
      case TypeMap.googleHybrid:
        urlTileProvider = TileProviders.urlgoogleHybrid;
        break;
      case TypeMap.osm:
        urlTileProvider = TileProviders.urlOsm;
        break;
      case TypeMap.osmHot:
        urlTileProvider = TileProviders.urlOsmHot;
        break;
      case TypeMap.osmFr:
        urlTileProvider = TileProviders.urlOsmFr;
        break;
      case TypeMap.cartoMapDark:
        urlTileProvider = TileProviders.urlCartoMapDark;
        break;
      case TypeMap.cartoMapPositron:
        urlTileProvider = TileProviders.urlCartoMapPositron;
        break;
      case TypeMap.stamenTerrain:
        urlTileProvider = TileProviders.urlStamenTerrain;
        break;
      case TypeMap.stamenToner:
        urlTileProvider = TileProviders.urlStamenToner;
        break;
      case TypeMap.stamenWater:
        urlTileProvider = TileProviders.urlStamenWater;
        break;
      case TypeMap.esriSatellite:
        urlTileProvider = TileProviders.urlEsriSatellite;
        break;
      case TypeMap.esriStreets:
        urlTileProvider = TileProviders.urlEsriStreets;
        break;
      case TypeMap.esriTopo:
        urlTileProvider = TileProviders.urlEsriTopo;
        break;
    }
    return urlTileProvider;
  }

  _getSubdomains(TypeMap t) {
    List<String> domains;
    switch (t) {
      case TypeMap.google:
        domains = [];
        break;
      case TypeMap.googleSatellite:
        domains = [];
        break;
      case TypeMap.googleHybrid:
        domains = [];
        break;
      default:
        domains = ['a', 'b', 'c'];
        break;
    }
    return domains;
  }
}

class Atribuciones {
  Atribuciones();
  static Widget defaultWidget({
    required String source,
    required TypeMap typeMap,
    void Function()? onSourceTapped,
    TextStyle sourceTextStyle =
        const TextStyle(color: Color(0xFF0078a8), fontSize: 10),
    Alignment alignment = Alignment.bottomLeft,
  }) =>
      Align(
        alignment: alignment,
        child: ColoredBox(
          color: const Color(0xCCFFFFFF),
          child: GestureDetector(
            onTap: onSourceTapped,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    cursor: onSourceTapped == null
                        ? MouseCursor.defer
                        : SystemMouseCursors.click,
                    child: Text(
                      "${_setAttrib(typeMap)} $source",
                      style: onSourceTapped == null ? null : sourceTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  static _setAttrib(TypeMap t) {
    String attribucion = "";
    switch (t) {
      case TypeMap.google:
        attribucion = "GoogleMaps";
        break;
      case TypeMap.googleSatellite:
        attribucion = "GoogleMaps";
        break;
      case TypeMap.googleHybrid:
        attribucion = "GoogleMaps";
        break;
      case TypeMap.osm:
        attribucion = "OpenStreetMap";
        break;
      case TypeMap.osmHot:
        attribucion = "OpenStreetMap";
        break;
      case TypeMap.osmFr:
        attribucion = "OpenStreetMap";
        break;
      case TypeMap.cartoMapDark:
        attribucion = "CartoMap";
        break;
      case TypeMap.cartoMapPositron:
        attribucion = "CartoMap";
        break;
      case TypeMap.stamenTerrain:
        attribucion = "Stamen";
        break;
      case TypeMap.stamenToner:
        attribucion = "Stamen";
        break;
      case TypeMap.stamenWater:
        attribucion = "Stamen";
        break;
      case TypeMap.esriSatellite:
        attribucion = "Esri";
        break;
      case TypeMap.esriStreets:
        attribucion = "Esri";
        break;
      case TypeMap.esriTopo:
        attribucion = "Esri";
        break;
    }
    return attribucion;
  }
}

class TileProviders {
  static String urlGoogle = "http://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}",
      urlGoogleSatellite =
          "http://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}",
      urlgoogleHybrid = "http://mt{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",
      urlGoogleTerrain =
          "http://mt0.google.com/vt/lyrs=t&hl=en&x={x}&y={y}&z={z}",
      urlOsm = "https://{s}.tile.osm.org/{z}/{x}/{y}.png",
      urlOsmHot = "http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
      urlOsmFr = "http://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png",
      urlCartoMapPositron =
          "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
      urlCartoMapDark =
          "http://a.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png",
      urlStamenTerrain = "http://a.tile.stamen.com/terrain/{z}/{x}/{y}.png",
      urlStamenToner = "http://tile.stamen.com/toner/{z}/{x}/{y}.png",
      urlStamenWater = "http://tile.stamen.com/watercolor/{z}/{x}/{y}.jpg",
      urlEsriSatellite =
          "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
      urlEsriStreets =
          "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
      urlEsriTopo =
          "https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}";
}
