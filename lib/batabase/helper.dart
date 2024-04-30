import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/offlinemap.dart';

class IsarHelper {
  static IsarHelper? helper;
  IsarHelper.internal();

  static IsarHelper get instance => helper ??= IsarHelper.internal();

  static Isar? _isarDB;

  Isar get isar => _isarDB!;

  static Future<void> init() async {
    if (_isarDB != null) {
      return;
    }
    final path = (await getApplicationDocumentsDirectory()).path;
    _isarDB = await Isar.open([OfflineMapSchema], directory: path);
    await FMTCObjectBoxBackend().initialise(
      rootDirectory: path,
    );
    await FMTCStore('OfflineMap').manage.create();
  }
}
