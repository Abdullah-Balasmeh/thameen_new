import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/language/language_service.dart';

class LanguageProvider extends ChangeNotifier {
  final LanguageService _languageService = getIt<LanguageService>();

  late Locale _currentLocale;

  LanguageProvider() {
    _currentLocale = _languageService.getSavedLocale();
  }

  Locale get currentLocale => _currentLocale;

  bool get isArabic => _currentLocale.languageCode == 'ar';

  void changeLanguage(String languageCode) {
    _currentLocale = Locale(languageCode);
    _languageService.saveLocale(_currentLocale);
    notifyListeners();
  }
}
