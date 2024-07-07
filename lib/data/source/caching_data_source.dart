import 'dart:io';
import 'package:hive/hive.dart';

sealed class CachingDataSource {
  Future<void> init();
  Future<void> insertData(String key, dynamic value);
  dynamic getData(String key);
  Future<void> deleteData(String key);
  Future<void> close();
}

class CachingDataSourceImpl implements CachingDataSource {
  final Directory directory;
  final HiveInterface hive;
  const CachingDataSourceImpl(
    this.directory,
    this.hive,
  );

  static const _boxName = 'we_movies_storage';

  // Initialize Hive box
  @override
  Future<void> init() async {
    hive.init(directory.path);
    await hive.openBox(_boxName);
  }

  // Get reference to the hive box
  Box _getBox() {
    return hive.box(_boxName);
  }

  // Insert data into hive
  @override
  Future<void> insertData(String key, dynamic value) async {
    final box = _getBox();
    await box.put(key, value);
  }

  // Get data from hive
  @override
  dynamic getData(String key) {
    final box = _getBox();
    return box.get(key);
  }

  // Delete data from hive
  @override
  Future<void> deleteData(String key) async {
    final box = _getBox();
    await box.delete(key);
  }

  // Close the hive box
  @override
  Future<void> close() async {
    await hive.close();
  }
}
