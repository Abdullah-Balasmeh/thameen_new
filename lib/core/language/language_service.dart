import 'package:flutter/material.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class LanguageService {
  static const _key = 'app_language';

  Locale getSavedLocale() {
    final code = SharedPreferencesSingleton.getString(_key);

    if (code.isEmpty) {
      return const Locale('en'); // default
    }

    return Locale(code);
  }

  Future<void> saveLocale(Locale locale) async {
    await SharedPreferencesSingleton.setString(_key, locale.languageCode);
  }
}
