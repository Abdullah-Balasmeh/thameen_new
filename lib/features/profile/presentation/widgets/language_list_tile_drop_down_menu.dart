import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';
import 'package:thameen/generated/l10n.dart';

class LanguageListTileDropDownMenu extends StatefulWidget {
  const LanguageListTileDropDownMenu({super.key});

  @override
  State<LanguageListTileDropDownMenu> createState() =>
      _LanguageListTileDropDownMenuState();
}

class _LanguageListTileDropDownMenuState
    extends State<LanguageListTileDropDownMenu> {
  String? currentLanguage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final languageProvider = Provider.of<LanguageProvider>(
      context,
      listen: false,
    );
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          Icons.language,
          color: theme.iconTheme.color,
          size: 26,
        ),
        title: Text(
          S.of(context).language,
          style: theme.textTheme.bodyLarge,
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.4),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value:
                  currentLanguage ??
                  (languageProvider.isArabic ? 'Arabic' : 'English'),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: theme.iconTheme.color,
              ),
              elevation: 2,
              borderRadius: BorderRadius.circular(16),
              style: theme.textTheme.bodyMedium,
              dropdownColor: theme.colorScheme.surface,
              items: [
                DropdownMenuItem(
                  value: 'English',
                  child: Text(S.current.english),
                ),
                DropdownMenuItem(
                  value: 'Arabic',
                  child: Text(S.current.arabic),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  currentLanguage = value;
                });
                languageProvider.changeLanguage(
                  value == 'English' ? 'en' : 'ar',
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
