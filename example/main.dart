import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';
import 'package:simple_tiles_map/type_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Tiles Map Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MapExamplePage(),
    );
  }
}

class MapExamplePage extends StatefulWidget {
  const MapExamplePage({super.key});

  @override
  State<MapExamplePage> createState() => _MapExamplePageState();
}

class _MapExamplePageState extends State<MapExamplePage> {
  late MapController _mapController;
  TypeMap _currentMapType = TypeMap.osm;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _changeMapType(TypeMap newType) {
    setState(() {
      _currentMapType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Tiles Map'),
        actions: [
          PopupMenuButton<TypeMap>(
            icon: const Icon(Icons.layers),
            tooltip: 'Cambiar tipo de mapa',
            onSelected: _changeMapType,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: TypeMap.osm,
                child: Text('OpenStreetMap'),
              ),
              const PopupMenuItem(
                value: TypeMap.google,
                child: Text('Google Maps'),
              ),
              const PopupMenuItem(
                value: TypeMap.googleSatellite,
                child: Text('Google Satellite'),
              ),
              const PopupMenuItem(
                value: TypeMap.googleHybrid,
                child: Text('Google Hybrid'),
              ),
              const PopupMenuItem(
                value: TypeMap.cartoMapPositron,
                child: Text('Carto Light'),
              ),
              const PopupMenuItem(
                value: TypeMap.cartoMapDark,
                child: Text('Carto Dark'),
              ),
              const PopupMenuItem(
                value: TypeMap.stamenWater,
                child: Text('Stamen Watercolor'),
              ),
            ],
          ),
        ],
      ),
      body: SimpleTilesMap(
        typeMap: _currentMapType,
        mapController: _mapController,
        mapOptions: MapOptions(
          initialCenter: const LatLng(-16.480954, -68.189594),
          initialZoom: 13.0,
          minZoom: 5.0,
          maxZoom: 18.0,
        ),
        attribution: "| Simple Tiles Map Example",
        additionalLayers: [
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(-16.480954, -68.189594),
                width: 80,
                height: 80,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'zoom_in',
            mini: true,
            tooltip: 'Zoom in',
            child: const Icon(Icons.add),
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom + 1,
              );
            },
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'zoom_out',
            mini: true,
            tooltip: 'Zoom out',
            child: const Icon(Icons.remove),
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom - 1,
              );
            },
          ),
        ],
      ),
    );
  }
}