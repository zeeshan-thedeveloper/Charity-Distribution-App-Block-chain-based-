import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPreferencedHelper {
  static read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key)!);
  }

  static save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
