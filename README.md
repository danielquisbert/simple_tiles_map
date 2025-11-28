# Simple Tiles Map

![Version](https://img.shields.io/badge/version-3.0.0-blue)
![Flutter](https://img.shields.io/badge/flutter-%3E%3D3.0.0-blue)
![Dart](https://img.shields.io/badge/dart-%3E%3D3.0.2-blue)

Un package de Flutter para crear mapas base de manera sencilla usando diferentes proveedores de tiles como OpenStreetMap, Google Maps, Stamen, CartoDB y Esri. Compatible con cualquier versión de flutter_map >= 8.0.0.

## 🎯 Características

- ✅ Soporte para múltiples proveedores de mapas
- ✅ Mapas online y offline
- ✅ Compatible con flutter_map ^8.0.0+
- ✅ Fácil de usar y configurar
- ✅ Personalización completa
- ✅ Atribuciones automáticas

## 📦 Instalación

Agrega el package a tu `pubspec.yaml`:

```yaml
dependencies:
  simple_tiles_map: ^3.0.0
  flutter_map: ^8.0.0
  latlong2: ^0.9.0
  
  # Solo si usarás mapas offline:
  flutter_map_tile_caching: ^10.0.0
```

## 🚀 Uso Básico

```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

class MyMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SimpleTilesMap(
        typeMap: TypeMap.osm,
        mapController: MapController(),
        mapOptions: MapOptions(
          initialCenter: LatLng(-16.480954, -68.189594),
          initialZoom: 13.0,
          minZoom: 5.0,
          maxZoom: 18.0,
        ),
      ),
    );
  }
}
```

## 🗺️ Tipos de Mapas Disponibles

```dart
TypeMap.osm               // OpenStreetMap
TypeMap.osmHot            // OpenStreetMap Humanitarian
TypeMap.osmFr             // OpenStreetMap France
TypeMap.google            // Google Maps
TypeMap.googleSatellite   // Google Satellite
TypeMap.googleHybrid      // Google Hybrid
TypeMap.cartoMapPositron  // Carto Light
TypeMap.cartoMapDark      // Carto Dark
TypeMap.stamenTerrain     // Stamen Terrain
TypeMap.stamenToner       // Stamen Toner
TypeMap.stamenWater       // Stamen Watercolor
TypeMap.esriSatellite     // Esri Satellite
TypeMap.esriStreets       // Esri Streets
TypeMap.esriTopo          // Esri Topographic
TypeMap.custom            // Mapa personalizado
```

## 📍 Ejemplo con Marcadores

```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

class MapWithMarkers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa con Marcadores')),
      body: SimpleTilesMap(
        typeMap: TypeMap.google,
        mapController: MapController(),
        mapOptions: MapOptions(
          initialCenter: LatLng(-16.480954, -68.189594),
          initialZoom: 13.0,
        ),
        additionalLayers: [
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-16.480954, -68.189594),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

## 🔌 Uso Offline

Para usar mapas offline, primero debes configurar `flutter_map_tile_caching`:

### 1. Agregar dependencia

```yaml
dependencies:
  flutter_map_tile_caching: ^10.0.0
```

### 2. Inicializar en tu app

```dart
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar FMTC
  final appDir = await getApplicationDocumentsDirectory();
  await FMTCObjectBoxBackend().initialise(rootDirectory: appDir.path);
  await FMTCStore('OfflineMap').manage.create();
  
  runApp(MyApp());
}
```

### 3. Usar SimpleTilesMap con modo offline

```dart
SimpleTilesMap(
  typeMap: TypeMap.osm,
  mapController: MapController(),
  mapOptions: MapOptions(
    initialCenter: LatLng(-16.480954, -68.189594),
    initialZoom: 13.0,
  ),
  isOffline: true,
  storeName: 'OfflineMap',
  cachedValidDuration: 30, // días
)
```

## ⚙️ Parámetros de Configuración

| Parámetro | Tipo | Requerido | Default | Descripción |
|-----------|------|-----------|---------|-------------|
| `typeMap` | `TypeMap` | ✅ | - | Tipo de mapa a mostrar |
| `mapController` | `MapController` | ✅ | - | Controlador del mapa |
| `mapOptions` | `MapOptions` | ✅ | - | Opciones de configuración del mapa |
| `customUrlTemplate` | `String?` | ❌ | null | URL personalizada para TypeMap.custom |
| `attribution` | `String` | ❌ | "| Simple Tiles Map" | Texto de atribución adicional |
| `additionalLayers` | `List<Widget>` | ❌ | [] | Capas adicionales (marcadores, polígonos, etc) |
| `isOffline` | `bool` | ❌ | false | Activar modo offline |
| `packageId` | `String` | ❌ | "com.simpletilesmap.app" | ID del package para user agent |
| `cachedValidDuration` | `int` | ❌ | 200 | Días de validez del caché |
| `storeName` | `String` | ❌ | "OfflineMap" | Nombre del store FMTC |
| `showAttribution` | `bool` | ❌ | true | Mostrar/ocultar atribuciones |

## 🎨 Ejemplo Completo con UI

```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

class InteractiveMapPage extends StatefulWidget {
  @override
  _InteractiveMapPageState createState() => _InteractiveMapPageState();
}

class _InteractiveMapPageState extends State<InteractiveMapPage> {
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
        title: Text('Mapa Interactivo'),
        actions: [
          PopupMenuButton<TypeMap>(
            icon: Icon(Icons.layers),
            onSelected: _changeMapType,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: TypeMap.osm,
                child: Text('OpenStreetMap'),
              ),
              PopupMenuItem(
                value: TypeMap.google,
                child: Text('Google Maps'),
              ),
              PopupMenuItem(
                value: TypeMap.googleSatellite,
                child: Text('Google Satellite'),
              ),
              PopupMenuItem(
                value: TypeMap.cartoMapDark,
                child: Text('Carto Dark'),
              ),
            ],
          ),
        ],
      ),
      body: SimpleTilesMap(
        typeMap: _currentMapType,
        mapController: _mapController,
        mapOptions: MapOptions(
          initialCenter: LatLng(-16.480954, -68.189594),
          initialZoom: 13.0,
          minZoom: 5.0,
          maxZoom: 18.0,
        ),
        attribution: "| Mi Aplicación",
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'zoom_in',
            mini: true,
            child: Icon(Icons.add),
            onPressed: () {
              _mapController.move(
                _mapController.camera.center,
                _mapController.camera.zoom + 1,
              );
            },
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'zoom_out',
            mini: true,
            child: Icon(Icons.remove),
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
```

## 🔄 Migración desde 2.x

### Cambios principales:
1. **Inicialización offline**: Ahora debes inicializar FMTC manualmente
2. **Dependencias**: Eliminadas Isar y path_provider del package
3. **API**: Misma API, solo cambia la configuración inicial

### Antes (2.x):
```dart
// No requería configuración adicional
SimpleTilesMap(
  isOffline: true,
  // ... otros parámetros
)
```

### Ahora (3.x):
```dart
// main.dart - Inicializar primero
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDir = await getApplicationDocumentsDirectory();
  await FMTCObjectBoxBackend().initialise(rootDirectory: appDir.path);
  await FMTCStore('OfflineMap').manage.create();
  runApp(MyApp());
}

// Usar igual que antes
SimpleTilesMap(
  isOffline: true,
  // ... otros parámetros
)
```

## 📄 Licencia

MIT License - Ver [LICENSE](LICENSE) para más detalles.

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor abre un issue o pull request en el repositorio.

## 📧 Contacto

- Repository: https://github.com/danielquisbert/simple_tiles_map
- Issues: https://github.com/danielquisbert/simple_tiles_map/issues

## 🙏 Créditos

Basado en el package [base_map_osm_google](https://pub.dev/packages/base_map_osm_google).