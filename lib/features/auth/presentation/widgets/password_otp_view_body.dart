import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/auth/presentation/views/new_password_view.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class PasswordOtpViewBody extends StatefulWidget {
  const PasswordOtpViewBody({super.key});

  @override
  State<PasswordOtpViewBody> createState() => _PasswordOtpViewBodyState();
}

class _PasswordOtpViewBodyState extends State<PasswordOtpViewBody>
    with TickerProviderStateMixin {
  String currentText = '';
  int _secondsRemaining = 30;
  bool _canResend = false;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(seconds: 30),
          )
          ..addListener(() {
            setState(() {
              _secondsRemaining = 30 - (_controller.value * 30).floor();
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                _canResend = true;
              });
            }
          });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.kPaddingHorizontal,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: SvgPicture.asset(
                Assets.imagesOtpVerification,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            Text(S.of(context).verifyYourEmail, style: AppTextStyle.bold24),

            const SizedBox(height: 16),

            Text(
              S.of(context).enter6DigitCodeEmail,
              style: AppTextStyle.medium16,
            ),

            const SizedBox(height: 8),

            Text(
              'abdullah@gmail.com',
              style: AppTextStyle.semiBold18.copyWith(
                color: AppColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primary,
              ),
            ),

            const SizedBox(height: 30),
            Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 6,
                enableActiveFill: true,
                backgroundColor: Colors.transparent,
                onCompleted: (value) {
                  currentText = value;
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeColor: AppColors.primary,
                  selectedColor: AppColors.primary,
                  inactiveColor: AppColors.lightBorder,
                  inactiveFillColor: Colors.white,
                  activeFillColor: Theme.of(context).scaffoldBackgroundColor,
                  selectedFillColor: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 20),

            AppButton(
              child: Text(
                S.of(context).verifyButton,
                style: AppTextStyle.bold20,
              ),
              onPressed: () {
                Navigator.pushNamed(context, NewPasswordView.routeName);
              },
            ),
            const SizedBox(height: 18),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).didntReceiveCode,
                  style: AppTextStyle.medium14,
                ),
                if (!_canResend)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      const Text('You may request a new code in '),
                      Text(
                        _secondsRemaining.toString(),
                        style: AppTextStyle.semiBold18.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text('seconds'),
                    ],
                  ),

                TextButton(
                  onPressed: _canResend
                      ? () {
                          // TODO: call resend OTP API here

                          setState(() {
                            _canResend = false;
                            _secondsRemaining = 30;
                          });

                          _controller.reset();
                          _controller.forward();
                        }
                      : null,
                  child: Text(
                    S.of(context).resendCode,
                    style: AppTextStyle.medium16.copyWith(
                      color: _canResend ? AppColors.primary : Colors.grey,
                      decoration: _canResend
                          ? TextDecoration.underline
                          : TextDecoration.none,
                      decorationColor: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
