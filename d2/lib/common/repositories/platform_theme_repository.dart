import 'package:d2/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlatformThemeRepository {
  static const String _platformTheme = "darkMode";

  final SharedPreferences _preferences;

  PlatformThemeRepository(this._preferences);

  Future<void> setTheme(bool isDarkMode) async {
    _preferences.setBool(_platformTheme, isDarkMode);
  }

  bool getTheme(BuildContext context) {
    return _preferences.getBool(_platformTheme) ?? isDarkMode(context);
  }
}
