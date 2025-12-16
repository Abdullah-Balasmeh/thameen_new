import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          icon,
          color: theme.iconTheme.color,
          size: 28,
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge,
        ),
        trailing: const Padding(
          padding: EdgeInsets.only(right: 8),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
