import 'package:flutter/material.dart';

class LanguageListTileDropDownMenu extends StatelessWidget {
  const LanguageListTileDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      visualDensity: VisualDensity.compact,
      horizontalTitleGap: 16,
      minVerticalPadding: 0,
      leading: Icon(
        Icons.language,
        color: theme.iconTheme.color,
        size: 28,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Language',
          style: theme.textTheme.bodyLarge,
        ),
      ),
      trailing: DropdownButton<String>(
        value: 'English',
        underline: null,
        dropdownColor: theme.colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        items: [
          DropdownMenuItem(
            value: 'English',
            child: Text(
              'English',
              style: theme.textTheme.bodyMedium,
            ),
          ),
          DropdownMenuItem(
            value: 'Arabic',
            child: Text(
              'Arabic',
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
