import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:thameen/features/auth/presentation/widgets/sign_up_view_body_bloc_consumer.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/switch_mode_and_language.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = 'signup_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: authAppBar(
          context: context,
          title: S.of(context).signupTitle,
          showButtonBack: true,
          onPressed: () {
            Navigator.pop(context);
          },
          actions: [
            const SwitchModeAndLanguage(),
          ],
        ),
        body: const SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
