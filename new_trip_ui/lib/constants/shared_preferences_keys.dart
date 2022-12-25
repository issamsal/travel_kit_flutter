import 'package:flutter/material.dart';
import 'package:new_trip_ui/models/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKeys {
  static _setStringData({required String key, required String text}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, text);
  }

  Future<String?> _getStringData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  _setIntData({required String key, required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, id);
  }

  Future<int?> _getIntData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<ThemeModeType> getThemeMode() async {
    int? index = await _getIntData(key: 'ThemeModeType');
    if (index != null) {
      return ThemeModeType.values[index];
    } else {
      return ThemeModeType.system;
    }
  }

  Future setThemeMode(ThemeModeType type) async {
    await _setIntData(key: 'ThemeModeType', id: type.index);
  }

  Future<FontFamilyType> getFontType() async {
    int? index = await _getIntData(key: 'FontType');
    if (index != null) {
      return FontFamilyType.values[index];
    } else {
      return FontFamilyType.workSans;
    }
  }

  Future setFontType(FontFamilyType type) async {
    await _setIntData(key: 'FontType', id: type.index);
  }

  Future setLanguageType(Locale locale) async {
    await _setStringData(key: 'language_type', text: locale.languageCode);
  }

  Future<Locale> getLanguageType() async {
    String? loc = await _getStringData(key: 'language_type');
    return Locale(loc ?? "en");
  }
}
