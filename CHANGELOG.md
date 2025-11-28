## 3.0.0

**BREAKING CHANGES:**
- Reestructuración completa del package
- Eliminadas dependencias específicas de Isar y path_provider
- Ahora requiere que el usuario configure flutter_map_tile_caching si desea usar offline maps
- Compatible con flutter_map ^8.0.0 y versiones superiores
- Dependencias más flexibles para mejor compatibilidad

**Mejoras:**
- Widget SimpleTilesMap optimizado y más limpio
- Mejor manejo de estados y lifecycle
- Soporte mejorado para mapas personalizados
- Código más mantenible y modular

**Migracion desde 2.x:**
Si usabas `isOffline: true`, ahora debes:
1. Agregar `flutter_map_tile_caching` a tu proyecto
2. Inicializar FMTC en tu app antes de usar SimpleTilesMap
3. El widget SimpleTilesMap funciona igual, solo cambió la configuración inicial

## 2.1.1

Fix protocol https url map google

## 2.1.0

Update flutterMap, improvment clases

## 2.0.1

set urlTileProvider default OSM

## 2.0.0

Version 2
add offline map

## 1.3.5

Update flutter_map

## 1.3.4

Add maxzoom to 20 in tilelayer

## 1.3.3

Corrección capas sobrepuestas boucle

## 1.3.2

Corrección capas sobrepuestas

## 1.3.1

uso de flutter_map 5

## 1.3.0

Soporte dart 3 
Corrección bug en opciones del mapa
uso de flutter_map 4

## 1.2.0

Adición MapOptions

## 1.1.0

Set minZoom and maxZoom

## 1.0.2

Ejemplo de insertar un marker

## 1.0.1

Mejora README

## 1.0.0

Primera versión del paquete, basado en el paquete base_map_osm_google. 
Este paquete más completo, permite crear mapas base de OSM, Google, Stamen, Carto y Esri de manera sencilla y simple.