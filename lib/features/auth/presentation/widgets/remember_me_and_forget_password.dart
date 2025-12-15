import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/views/forgot_password_view.dart';
import 'package:thameen/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:thameen/generated/l10n.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ForgotPasswordView.routeName);
          },
          child: Text(
            S.of(context).signinForgotPasswordLink,
            style: AppTextStyle.medium14.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ),
        const Spacer(),
        Text(
          S.of(context).signinRememberMeCheck,
          style: AppTextStyle.medium14,
        ),
        const SizedBox(width: 8),
        CustomCheckBox(
          onChecked: (value) {
            isRememberMe = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isRememberMe,
        ),
      ],
    );
  }
}
