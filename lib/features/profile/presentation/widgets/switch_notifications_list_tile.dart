import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwitchNotificationsListTile extends StatelessWidget {
  const SwitchNotificationsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool allowedNotifications = false;
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
        Icons.notifications,
        color: theme.iconTheme.color,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          'Notifications',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      value: allowedNotifications,
      onChanged: (value) {
        HapticFeedback.lightImpact();
        allowedNotifications = value;
      },
    );
  }
}
