import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/profile/presentation/widgets/account_settings.dart';
import 'package:thameen/features/profile/presentation/widgets/my_reports_card.dart';
import 'package:thameen/features/profile/presentation/widgets/profile_header.dart';
import 'package:thameen/features/profile/presentation/widgets/support_section.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfileHeader(),
          SizedBox(height: 24),
          MyReportsCard(),
          SizedBox(height: 24),
          AccountSettings(),
          SizedBox(height: 24),
          SupportSection(),
          SizedBox(height: 24),
          LogOutButton(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

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
        onPressed: () {},
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
}
