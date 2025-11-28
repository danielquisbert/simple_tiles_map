import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';

import 'attributions.dart';
import 'tile_providers.dart';
import 'type_map.dart';

class SimpleTilesMap extends StatefulWidget {
  final TypeMap typeMap;
  final MapOptions mapOptions;
  final String? customUrlTemplate;
  final String attribution;
  final List<Widget> additionalLayers;
  final MapController mapController;
  final bool isOffline;
  final String packageId;
  final int cachedValidDuration;
  final int maxCacheSize;
  final void Function(Exception)? onCacheError;
  final bool showAttribution;
  final String storeName;

  const SimpleTilesMap({
    super.key,
    required this.typeMap,
    required this.mapOptions,
    this.customUrlTemplate,
    this.attribution = "| Simple Tiles Map",
    this.additionalLayers = const [],
    required this.mapController,
    this.isOffline = false,
    this.packageId = "com.simpletilesmap.app",
    this.cachedValidDuration = 200,
    this.maxCacheSize = 20000,
    this.onCacheError,
    this.showAttribution = true,
    this.storeName = "OfflineMap",
  });

  @override
  State<SimpleTilesMap> createState() => _SimpleTilesMapState();
}

class _SimpleTilesMapState extends State<SimpleTilesMap> {
  late String _urlTemplate;
  late List<String> _subdomains;

  @override
  void initState() {
    super.initState();
    _updateMapSettings();
  }

  @override
  void didUpdateWidget(SimpleTilesMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.typeMap != widget.typeMap ||
        oldWidget.customUrlTemplate != widget.customUrlTemplate) {
      _updateMapSettings();
    }
  }

  void _updateMapSettings() {
    if (widget.typeMap == TypeMap.custom && widget.customUrlTemplate != null) {
      _urlTemplate = widget.customUrlTemplate!;
      _subdomains = [];
    } else {
      _urlTemplate = TileProviders.getUrlTemplate(widget.typeMap);
      _subdomains = TileProviders.getSubdomains(widget.typeMap);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: widget.mapController,
      options: widget.mapOptions,
      children: _buildLayers(),
    );
  }

  List<Widget> _buildLayers() {
    final List<Widget> layers = [];

    if (widget.isOffline) {
      layers.add(_buildOfflineTileLayer());
    } else {
      layers.add(_buildOnlineTileLayer());
    }

    if (widget.additionalLayers.isNotEmpty) {
      layers.addAll(widget.additionalLayers);
    }

    if (widget.showAttribution) {
      layers.add(
        Attributions.buildWidget(
          source: widget.attribution,
          typeMap: widget.typeMap,
        ),
      );
    }

    return layers;
  }

  Widget _buildOnlineTileLayer() {
    return TileLayer(
      urlTemplate: _urlTemplate,
      subdomains: _subdomains,
      maxZoom: 20,
      userAgentPackageName: widget.packageId,
    );
  }

  Widget _buildOfflineTileLayer() {
    return TileLayer(
      urlTemplate: _urlTemplate,
      subdomains: _subdomains,
      userAgentPackageName: widget.packageId,
      tileProvider: FMTCTileProvider(
        stores: {widget.storeName: BrowseStoreStrategy.read},
        cachedValidDuration: Duration(days: widget.cachedValidDuration),
        errorHandler: (e) {
          debugPrint("Error: $e");
          return Uint8List(256);
        },
      ),
    );
  }
}