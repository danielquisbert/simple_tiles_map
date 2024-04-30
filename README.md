# Simple Tiles Map

## Capturas

[<img src="https://raw.githubusercontent.com/danielquisbert/simple_tiles_map/main/capturas/capturas.gif" width="400" />](https://raw.githubusercontent.com/danielquisbert/simple_tiles_map/main/capturas/capturas.gif)


## Cómo utilizar?

Ejemplo de uso básico
```dart
import 'package:flutter/material.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiles Basemap',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mapa Base ${TypeMap.stamenWater}'),
        ),
        body: Column(
          children: [
            SimpleTilesMap(typeMap: TypeMap.stamenWater),
          ],
        ),
      ),
    );
  }
}

```

Ejemplo insertando un Marker

[<img src="https://raw.githubusercontent.com/danielquisbert/simple_tiles_map/main/capturas/insert-marker.png" width="400" />](https://raw.githubusercontent.com/danielquisbert/simple_tiles_map/main/capturas/insert-marker.png)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:simple_tiles_map/simple_tiles_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Marker myMarker = Marker(
      width: 80.0,
      height: 80.0,
      point: LatLng(-16.480954, -68.189594),
      builder: (ctx) => const Icon(
        Icons.add_location_alt,
        color: Colors.red,
        size: 50,
      ),
    );
    return MaterialApp(
      title: 'Tiles Basemap',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Set Marker on Map'),
        ),
        body: Column(
          children: [
            SimpleTilesMap(
              typeMap: TypeMap.osmHot,
              isOffline: false,
              otherLayers: [
                MarkerLayer(
                  markers: [
                    myMarker,
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

```


