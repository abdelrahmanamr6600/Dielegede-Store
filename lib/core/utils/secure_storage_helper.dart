import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const secureStorageHelper = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await secureStorageHelper.write(key: 'token', value: token);
  }

  static Future<void> getToken() async {
    await secureStorageHelper.read(key: 'token');
  }

  static Future<void> deleteToken() async {
    await secureStorageHelper.delete(key: 'token');
  }
}
