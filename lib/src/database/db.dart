import 'dart:io';

import 'package:hive/hive.dart';
import 'package:psalms_skrifberymings/src/database/migrations.dart';

class DB {
  Future<void> init(Directory directory) async {
    Hive.init(directory.path);
  }

  Future<Box<Map>> getPsalmsCollection() async {
    return await Hive.openBox<Map>('psalms');
  }

  Future<void> seed() async {
    Box<Map> psalm = await getPsalmsCollection();
    Migrate().psalms().forEach((key, value) async {
      await psalm.put(key, value);
    });
  }

  Future<Map?> getPsalm(int nommer) async {
    Box<Map> psalms = await getPsalmsCollection();
    return psalms.get(nommer);
  }
}
