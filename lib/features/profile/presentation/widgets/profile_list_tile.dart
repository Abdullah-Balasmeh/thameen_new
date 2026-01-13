import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thameen/core/language/language_provider.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isChangePassword,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool? isChangePassword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isArabic = Provider.of<LanguageProvider>(context).isArabic;
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Padding(
          padding: isArabic
              ? EdgeInsets.only(right: isChangePassword == true ? 8 : 0)
              : EdgeInsets.only(left: isChangePassword == true ? 8 : 0),
          child: Icon(
            icon,
            color: theme.iconTheme.color,
            size: 28,
          ),
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge,
        ),
        trailing: Padding(
          padding: isArabic
              ? const EdgeInsets.only(left: 8)
              : const EdgeInsets.only(right: 8),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
