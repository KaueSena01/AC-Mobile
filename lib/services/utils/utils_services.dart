import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UtilsServices {
  final storage = const FlutterSecureStorage();

  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> getLocalData({
    required String key,
  }) async {
    return await storage.read(key: key);
  }

  Future<void> deleteLocalData({
    required String key,
  }) async {
    await storage.delete(key: key);
  }
}