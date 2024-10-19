import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static init() async {
    await GetStorage.init();
  }

  static saveJson({required String key, required value}) {
    final getStorage = GetStorage();
    var res = getStorage.write(key, value);
    return res;
  }

  static readJson({required String key}) {
    final getStorage = GetStorage();
    var res = getStorage.read(key);
    return res;
  }

  static deleteJson({required String key}) {
    final getStorage = GetStorage();
    var res = getStorage.remove(key);
    return res;
  }
}
