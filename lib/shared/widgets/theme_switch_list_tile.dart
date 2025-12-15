import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/theme/theme_provider.dart';

class ThemeSwitchListTile extends StatelessWidget {
  const ThemeSwitchListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final themeMode = themeProvider.themeMode;
    final bool isDark =
        themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      trackOutlineColor: WidgetStateProperty.resolveWith(
        (states) => Theme.of(context).colorScheme.primary,
      ),
      activeThumbColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Theme.of(context).primaryColor.withOpacity(0.5),
      inactiveThumbColor: Theme.of(context).primaryColor,
      secondary: Icon(
        isDark ? Icons.dark_mode : Icons.light_mode,
        color: !isDark
            ? const Color(0xffF7CF3C)
            : Theme.of(context).colorScheme.onSurface,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          isDark ? 'Dark Mode' : 'Light Mode',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      value: isDark,
      onChanged: (value) {
        HapticFeedback.lightImpact();
        themeProvider.toggleTheme(value);
      },
    );
  }
}
