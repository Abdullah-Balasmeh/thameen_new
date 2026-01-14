import 'package:flutter/material.dart';
import 'package:thameen/features/auth/presentation/widgets/new_password_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class NewPasswordView extends StatelessWidget {
  const NewPasswordView({super.key});
  static const String routeName = 'new_password_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          title: 'New Password',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: const NewPasswordViewBodyBlocConsumer(),
      ),
    );
  }
}
