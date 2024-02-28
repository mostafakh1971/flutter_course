import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPrefrences;
  static init() async {
    sharedPrefrences = await SharedPreferences.getInstance();
  }

  static setBool({required String key, required bool value}) {
    sharedPrefrences?.setBool(key, value);
  }

  static setString({required String key, required String value}) {
    sharedPrefrences?.setString(key, value);
  }

  static get({required String key}) {
    return sharedPrefrences?.get(key);
  }
}
