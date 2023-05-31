import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static String getString(String key, [String? defValue]) {
    return instance.getString(key) ?? defValue ?? "";
  }

  static bool getBool(String key) {
    return instance.getBool(key) ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    return instance.setString(key, value) ?? Future.value(false);
  }

  static Future<bool> setBool(String key, bool value) async {
    return instance.setBool(key, value) ?? Future.value(false);
  }

  static Future clearData() {
    return instance.clear();
  }
}
