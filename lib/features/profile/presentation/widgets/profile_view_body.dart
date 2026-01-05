import 'package:flutter/material.dart';
import 'package:thameen/features/profile/presentation/widgets/account_settings.dart';
import 'package:thameen/features/profile/presentation/widgets/log_out_button.dart';
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
