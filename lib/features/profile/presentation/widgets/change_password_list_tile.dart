import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:thameen/generated/l10n.dart';

class ChangePasswordListTile extends StatelessWidget {
  const ChangePasswordListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: AppColors.lightBorder,
        ),
      ),
      child: ProfileListTile(
        icon: Icons.lock,
        title: S.of(context).changePassword,
        isChangePassword: true,
        onTap: () {
          // TODO: Navigate to change password view
        },
      ),
    );
  }
}
