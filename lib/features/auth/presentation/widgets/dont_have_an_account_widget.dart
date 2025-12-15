import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/auth/presentation/views/sign_up_view.dart';
import 'package:thameen/generated/l10n.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: S.of(context).signinNoAccountText,
            style: AppTextStyle.semiBold18,
          ),
          TextSpan(
            text: ' ',
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.lightBorder,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignUpView.routeName);
              },
            text: S.of(context).signinCreateAccountLink,
            style: AppTextStyle.semiBold18.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
