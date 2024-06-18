import 'package:get_storage/get_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'storage_service.dart';

class GetStorageService extends StorageService {
  final _box = GetStorage();

  @override
  Future<void> save(String key, String data) => _box.write(key, data);

  @override
  String read(String key) => _box.read<String>(key) ?? '';

  @override
  Future<void> remove(String key) => _box.remove(key);

  @override
  Future<void> clear() async => await _box.erase();
}

final storageServiceProvider = Provider((ref) => GetStorageService());
