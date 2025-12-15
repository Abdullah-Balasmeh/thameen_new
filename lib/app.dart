import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/routes/on_generate_route.dart';
import 'package:thameen/core/theme/app_theme.dart';
import 'package:thameen/core/theme/theme_provider.dart';
import 'package:thameen/features/splash/presentation/views/splash_view.dart';
import 'package:thameen/generated/l10n.dart';

class ThameenApp extends StatelessWidget {
  const ThameenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: languageProvider.currentLocale,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(languageProvider.isArabic),
      darkTheme: AppTheme.dark(languageProvider.isArabic),
      themeMode: themeProvider.themeMode,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
