import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/auth/presentation/bloc/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/app_text_from_field.dart';
import 'package:thameen/shared/widgets/loading_button.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  late TextEditingController _emailController;
  bool _emailTouched = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    bool isButtonEnabled = true;
    var forgotPasswordCubit = context.watch<ForgotPasswordCubit>();
    if (forgotPasswordCubit.state is FPEmailLoading) {
      isLoading = true;
      isButtonEnabled = false;
    } else {
      isLoading = false;
      isButtonEnabled = true;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.kPaddingHorizontal,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            SvgPicture.asset(Assets.imagesForgotPassword, height: 250),
            const SizedBox(height: 24),
            Text(
              S.of(context).sendVerificationCodeInfo,
              style: AppTextStyle.bold20,
            ),
            const SizedBox(height: 24),
            AppTextFromField(
              hintText: S.of(context).signinEmailLabel,
              prefixIcon: const Icon(Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).signinEmailAddressIsRequired;
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return S.of(context).signinErrorInvalidEmail;
                }
                return null;
              },
              autovalidateMode: _emailTouched
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              onChanged: (value) {
                if (!_emailTouched) {
                  setState(() {
                    _emailTouched = true;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            AppButton(
              child: isLoading
                  ? const LoadingButton()
                  : Text(
                      S.of(context).resetPasswordButton,
                      style: AppTextStyle.bold20,
                    ),
              onPressed: () {
                if (isButtonEnabled) {
                  forgotPasswordCubit.sendOtp(
                    _emailController.text.toLowerCase(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
