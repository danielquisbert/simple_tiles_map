import 'type_map.dart';

class TileProviders {
  // URLs de proveedores organizadas en un Map para facilitar mantenimiento
  static final Map<TypeMap, String> urlTemplates = {
    TypeMap.google: "https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}",
    TypeMap.googleSatellite: "https://www.google.cn/maps/vt?lyrs=s@189&gl=cn&x={x}&y={y}&z={z}",
    TypeMap.googleHybrid: "https://mt{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}",
    TypeMap.osm: "https://{s}.tile.osm.org/{z}/{x}/{y}.png",
    TypeMap.osmHot: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
    TypeMap.osmFr: "https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png",
    TypeMap.cartoMapPositron: "https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
    TypeMap.cartoMapDark: "https://a.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png",
    TypeMap.stamenTerrain: "https://a.tile.stamen.com/terrain/{z}/{x}/{y}.png",
    TypeMap.stamenToner: "https://tile.stamen.com/toner/{z}/{x}/{y}.png",
    TypeMap.stamenWater: "https://tile.stamen.com/watercolor/{z}/{x}/{y}.jpg",
    TypeMap.esriSatellite: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
    TypeMap.esriStreets: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/MapServer/tile/{z}/{y}/{x}",
    TypeMap.esriTopo: "https://server.arcgisonline.com/ArcGIS/rest/services/World_Topo_Map/MapServer/tile/{z}/{y}/{x}",
  };

  // Obtener URL por tipo
  static String getUrlTemplate(TypeMap type) {
    return urlTemplates[type] ?? urlTemplates[TypeMap.osm]!;
  }

  // Obtener subdominios por tipo
  static List<String> getSubdomains(TypeMap type) {
    switch (type) {
      case TypeMap.google:
      case TypeMap.googleSatellite:
      case TypeMap.googleHybrid:
      case TypeMap.custom:
        return [];
      default:
        return ['a', 'b', 'c'];
    }
  }
}