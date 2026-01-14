import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final user = {
      'name': SharedPreferencesSingleton.getString('userName'),
      'email': SharedPreferencesSingleton.getString('email'),
      'photoUrl': SharedPreferencesSingleton.getString('photoUrl'),
    };
    log('user: ${user['name']}');
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Avatar
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: (user['photoUrl'] == null || user['photoUrl']!.isEmpty)
                ? const Icon(
                    Icons.person,
                    size: 50,
                    color: AppColors.primary,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      user['photoUrl']!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
          ),
          const SizedBox(height: 16),
          // Name
          Text(
            user['name'] ?? 'User Name',
            style: AppTextStyle.bold24,
          ),
          const SizedBox(height: 4),
          // Email
          Text(
            user['email'] ?? 'demo@example.com',
            style: AppTextStyle.medium16,
          ),
        ],
      ),
    );
  }
}
