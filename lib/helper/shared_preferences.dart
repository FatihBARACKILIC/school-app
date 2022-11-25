import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<bool> saveUserData(String key, int value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(key, value);
  }

  static Future<int?> getUserData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? id = sharedPreferences.getInt(key);
    return id;
  }

  static Future<bool> removePreferences(String key) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.remove(key);

      return true;
    } catch (e) {
      return false;
    }
  }
}
