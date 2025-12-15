import 'package:flutter/material.dart';
import 'package:thameen/features/profile/presentation/widgets/app_divider.dart';
import 'package:thameen/features/profile/presentation/widgets/profile_list_tile.dart';

class SupportSection extends StatelessWidget {
  const SupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 16,
          ),

          ProfileListTile(
            icon: Icons.help,
            title: 'Help & Support',
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          ProfileListTile(
            icon: Icons.security,
            title: 'Privacy & Security',
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          ProfileListTile(
            icon: Icons.info,
            title: 'About',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
