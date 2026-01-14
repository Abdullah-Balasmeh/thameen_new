import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:thameen/features/auth/presentation/widgets/auth_app_bar.dart';
import 'package:thameen/features/auth/presentation/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/switch_mode_and_language.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const String routeName = 'signin_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt<AuthRepo>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: authAppBar(
            context: context,
            title: S.of(context).signinTitle,
            showButtonBack: false,
            onPressed: () {},
            actions: [
              const SwitchModeAndLanguage(),
            ],
          ),
          body: const SignInViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
