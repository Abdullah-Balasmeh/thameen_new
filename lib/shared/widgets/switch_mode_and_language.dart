import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/theme_provider.dart';
import 'package:thameen/generated/l10n.dart';

class SwitchModeAndLanguage extends StatelessWidget {
  const SwitchModeAndLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeMode = themeProvider.themeMode;
    final bool isDark =
        themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    return Row(
      mainAxisAlignment: languageProvider.isArabic
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            languageProvider.changeLanguage(
              languageProvider.isArabic ? 'en' : 'ar',
            );
          },
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                const Icon(Icons.language),
                const SizedBox(width: 2),
                Text(
                  S.of(context).localeName,
                  textAlign: TextAlign.end,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 4),
        IconButton(
          onPressed: () {
            themeProvider.toggleTheme(!isDark);
          },
          icon: isDark
              ? const Icon(Icons.light_mode_rounded, color: AppColors.gold)
              : const Icon(Icons.dark_mode_rounded),
        ),
      ],
    );
  }
}
