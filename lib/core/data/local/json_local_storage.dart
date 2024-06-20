import 'dart:convert';

import 'package:flutter_application_demo/core/data/local/storage_service.dart';

/// JSON Local Sync
/// Save and Get a Json [Map<String, dynamic>] from local persistent storage
class JsonStorage {
  final StorageService store;
  JsonStorage(this.store);

  /// Save a Json object to local persistent storage
  Future<void> save({
    required String key,
    required Map<String, dynamic> value,
  }) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(value);
    await store.save(key, jsonString);
  }

  /// Get a Json object from local persistent storage
  Future<Map<String, dynamic>?> get({required String key}) async {
    String? jsonString = store.read(key);
    if (jsonString.isEmpty) return null;
    Map<String, dynamic> value = jsonDecode(jsonString);
    return value;
  }

  Future<void> delete({required String key}) async {
    await store.remove(key);
  }
}
