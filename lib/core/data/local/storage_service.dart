/// Storage service interface
abstract class StorageService {
  String read(String key);

  Future<void> save(String key, String data);

  Future<void> remove(String key);

  Future<void> clear();

  // Future<bool> has(String key);
}
