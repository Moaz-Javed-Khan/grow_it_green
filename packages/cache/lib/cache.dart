library cache;

import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// {@template cache_client}
/// An in-memory cache client.
/// {@endtemplate}
class CacheClient {
  /// {@macro cache_client}
  CacheClient() : _cache = Hive.box('cache');

  final Box _cache;

  static Future<void> initializeCache() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    Hive.init('$appDocPath/cache');
    await Hive.openBox('cache');
  }

  /// Writes the provide [key], [value] pair to the in-memory cache.
  void write<T extends Object>({required String key, required T value}) {
    _cache.put(key, value);
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  T? read<T extends Object>({required String key}) {
    final value = _cache.get(key);
    if (value is T) return value;
    return null;
  }

  Future<void> clear() async {
    await _cache.clear();
  }

  Future<void> close() async {
    await _cache.close();
  }
}
