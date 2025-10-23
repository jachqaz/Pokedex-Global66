import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences!.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return await _preferences!.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences!.setBool(key, value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await _preferences!.setDouble(key, value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return await _preferences!.setStringList(key, value);
  }

  String getString(String key, {String defaultValue = ''}) {
    return _preferences!.getString(key) ?? defaultValue;
  }

  int getInt(String key, {int defaultValue = 0}) {
    return _preferences!.getInt(key) ?? defaultValue;
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _preferences!.getBool(key) ?? defaultValue;
  }

  double getDouble(String key, {double defaultValue = 0.0}) {
    return _preferences!.getDouble(key) ?? defaultValue;
  }

  List<String> getStringList(String key, {List<String>? defaultValue}) {
    return _preferences!.getStringList(key) ?? defaultValue ?? [];
  }

  Future<bool> setObject(String key, Map<String, dynamic> object) async {
    final jsonString = jsonEncode(object);
    return await setString(key, jsonString);
  }

  Map<String, dynamic> getObject(String key) {
    final jsonString = getString(key);
    if (jsonString.isEmpty) return {};
    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      if (kDebugMode) {
        print('Error decoding JSON for key $key: $e');
      }
      return {};
    }
  }

  Future<bool> setObjectList(
      String key, List<Map<String, dynamic>> objects) async {
    final jsonString = jsonEncode(objects);
    return await setString(key, jsonString);
  }

  List<Map<String, dynamic>> getObjectList(String key) {
    final jsonString = getString(key);
    if (jsonString.isEmpty) return [];
    try {
      final list = jsonDecode(jsonString) as List;
      return list.cast<Map<String, dynamic>>();
    } catch (e) {
      if (kDebugMode) {
        print('Error decoding JSON list for key $key: $e');
      }
      return [];
    }
  }

  Future<bool> remove(String key) async {
    return await _preferences!.remove(key);
  }

  Future<bool> clear() async {
    return await _preferences!.clear();
  }

  bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }
}
