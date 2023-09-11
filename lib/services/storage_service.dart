import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  Future<void> write(String key, dynamic value) async =>
      await _box.write(key, value);

  Future<void> remove(String key) async => await _box.remove(key);

  Future<void> clear() async => await _box.erase();

  String read(String key) => _box.read<String>(key) ?? '';
}
