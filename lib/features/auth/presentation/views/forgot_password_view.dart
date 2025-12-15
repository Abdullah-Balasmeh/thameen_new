import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/forgot_password_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = 'forgot_password_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        showButtonBack: true,
        showButtonActions: false,
        title: 'Forgot Password',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const ForgotPasswordViewBodyBlocConsumer(),
    );
  }
}
