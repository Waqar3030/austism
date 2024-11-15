import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static Future init() async {
    await GetStorage.init();
    log("Local storage initialized");
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

  static readJsonList({required String key}) {
    final getStorage = GetStorage();
    var res = getStorage.read<List>(key);
    return res;
  }

  static deleteJson({required String key}) {
    final getStorage = GetStorage();
    var res = getStorage.remove(key);
    return res;
  }
}

// ignore: camel_case_types
class lsk {
  static const String token = "token";
  static const String userData = "userData";
  static const String scheduleList = "scheduleList";
}
