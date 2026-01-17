import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/profile/presentation/widgets/change_password_view_body.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = 'change_password_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          backgroundColor: AppColors.primary,
          title: 'Change Password',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
