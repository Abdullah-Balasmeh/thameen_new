import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/theme_service.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeService _themeService = getIt<ThemeService>();
  late ThemeMode _themeMode;

  ThemeProvider() {
    _themeMode = _themeService.getSavedThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _themeService.saveThemeMode(_themeMode);
    notifyListeners();
  }

  void setSystemTheme() {
    _themeMode = ThemeMode.system;
    _themeService.saveThemeMode(_themeMode);
    notifyListeners();
  }
}
