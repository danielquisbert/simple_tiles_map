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
