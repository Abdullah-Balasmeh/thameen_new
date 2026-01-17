import 'package:flutter/material.dart';
import 'package:thameen/features/profile/presentation/views/change_password_view.dart';
import 'package:thameen/features/profile/presentation/views/edit_profile_view.dart';
import 'package:thameen/features/profile/presentation/widgets/app_divider.dart';
import 'package:thameen/features/profile/presentation/widgets/language_list_tile_drop_down_menu.dart';
import 'package:thameen/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:thameen/features/profile/presentation/widgets/switch_notifications_list_tile.dart';
import 'package:thameen/shared/widgets/theme_switch_list_tile.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

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
            'Account Settings',
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 16,
          ),

          ProfileListTile(
            icon: Icons.edit,
            title: 'Edit Profile',
            onTap: () {
              Navigator.pushNamed(context, EditProfileView.routeName);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          ProfileListTile(
            icon: Icons.lock_rounded,
            title: 'Change Password',
            onTap: () {
              Navigator.pushNamed(context, ChangePasswordView.routeName);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          const ThemeSwitchListTile(),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          const SwitchNotificationsListTile(),
          const SizedBox(
            height: 16,
          ),
          const AppDivider(),
          const SizedBox(
            height: 16,
          ),
          const LanguageListTileDropDownMenu(),
        ],
      ),
    );
  }
}
