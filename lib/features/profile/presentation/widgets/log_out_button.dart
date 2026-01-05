import 'package:flutter/material.dart';
import 'package:thameen/core/constants/shared_pref_constants.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          minimumSize: const Size(double.infinity, 56),
        ),
        onPressed: () => _showLogoutDialog(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.logout,
              color: Colors.white,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(
              'Log Out',
              style: AppTextStyle.bold20.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text(
          'Are you sure you want to log out from your account?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            onPressed: () {
              Navigator.pop(context); // close dialog
              _logout(context); // perform logout
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Text(
                'Log Out',
                style: AppTextStyle.medium16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) {
    SharedPreferencesSingleton.clearAll();
    SharedPreferencesSingleton.setBool(isOnboardingSeen, true);

    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInView.routeName,
      (route) => false,
    );
  }
}
