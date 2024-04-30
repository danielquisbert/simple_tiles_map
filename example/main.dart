import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LatLng? mapCenter = const LatLng(-16.480954, -68.189594);
    MapOptions mapOptions = MapOptions(
      initialCenter: mapCenter,
      maxZoom: 19,
      minZoom: 5,
    );
    return MaterialApp(
      title: 'Tiles Basemap',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa Base ${TypeMap.stamenWater}'),
        ),
        body: Column(
          children: [
            SimpleTilesMap(
              typeMap: TypeMap.stamenWater,
              mapOptions: mapOptions,
              isOffline: false,
            ),
          ],
        ),
      ),
    );
  }
}
