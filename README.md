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


