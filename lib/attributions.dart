import 'package:flutter/material.dart';
import 'type_map.dart';

class Attributions {
  static final Map<TypeMap, String> _attributions = {
    TypeMap.google: "Google Maps",
    TypeMap.googleSatellite: "Google Maps",
    TypeMap.googleHybrid: "Google Maps",
    TypeMap.osm: "OpenStreetMap Contributors",
    TypeMap.osmHot: "OpenStreetMap Contributors",
    TypeMap.osmFr: "OpenStreetMap France",
    TypeMap.cartoMapDark: "CartoDB",
    TypeMap.cartoMapPositron: "CartoDB",
    TypeMap.stamenTerrain: "Stamen Design",
    TypeMap.stamenToner: "Stamen Design",
    TypeMap.stamenWater: "Stamen Design",
    TypeMap.esriSatellite: "Esri",
    TypeMap.esriStreets: "Esri",
    TypeMap.esriTopo: "Esri",
    TypeMap.custom: "Custom",
  };

  static String getAttribution(TypeMap type) {
    return _attributions[type] ?? "Map data";
  }

  static Widget buildWidget({
    required String source,
    required TypeMap typeMap,
    void Function()? onSourceTapped,
    TextStyle sourceTextStyle = const TextStyle(color: Color(0xFF0078a8), fontSize: 10),
    Alignment alignment = Alignment.bottomLeft,
  }) {
    return Align(
      alignment: alignment,
      child: ColoredBox(
        color: const Color(0xCCFFFFFF),
        child: GestureDetector(
          onTap: onSourceTapped,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  cursor: onSourceTapped == null
                      ? MouseCursor.defer
                      : SystemMouseCursors.click,
                  child: Text(
                    "${getAttribution(typeMap)} $source",
                    style: onSourceTapped == null ? null : sourceTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}