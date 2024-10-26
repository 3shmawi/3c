import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPref {
  static late final SharedPreferences _preferences;

  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static saveData(String key, dynamic value) {
    if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is String) {
      _preferences.setString(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else {
      throw Exception('Unsupported data type');
    }
  }

  static clearData() {
    _preferences.clear();
  }

  static getData(String key) {
    return _preferences.get(key);
  }

  static deleteData(String key) {
    _preferences.remove(key);
  }
}
