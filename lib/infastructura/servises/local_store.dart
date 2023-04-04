import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore {
  static setTheme(bool value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setBool("theme", value);
  }

  static Future<bool> getTheme() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getBool("theme") ?? true;
  }

  static setToken(String value) async {
    SharedPreferences local = await SharedPreferences.getInstance();
    local.setString("token", value);
  }

  static Future<String> getToken() async {
    SharedPreferences local = await SharedPreferences.getInstance();
    return local.getString("token") ?? "";
  }
}
