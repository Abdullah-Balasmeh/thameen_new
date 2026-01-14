import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/password_otp_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class PasswordOtpView extends StatelessWidget {
  const PasswordOtpView({super.key});
  static const String routeName = 'password_otp_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          title: 'Password OTP',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const PasswordOtpViewBodyBlocConsumer(),
      ),
    );
  }
}
