import 'package:flutter/material.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class ThemeService {
  static const _key = 'theme_mode';

  ThemeMode getSavedThemeMode() {
    final value = SharedPreferencesSingleton.getString(_key);

    if (value.isEmpty) {
      return ThemeMode.system;
    }
    return _stringToThemeMode(value);
  }

  Future<void> saveThemeMode(ThemeMode mode) async {
    await SharedPreferencesSingleton.setString(_key, mode.name);
  }

  static ThemeMode _stringToThemeMode(String? mode) {
    switch (mode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
