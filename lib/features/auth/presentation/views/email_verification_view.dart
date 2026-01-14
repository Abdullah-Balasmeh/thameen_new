import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/auth/presentation/bloc/email_verification/email_verification_cubit.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/auth/presentation/widgets/email_verification_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});
  static const String routeName = 'email_verification_view';
  @override
  Widget build(BuildContext context) {
    String userEmail = ModalRoute.of(context)!.settings.arguments.toString();
    return BlocProvider(
      create: (context) => EmailVerificationCubit(getIt<AuthRepo>()),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: buildAppBar(
            context,
            showButtonBack: true,
            showButtonActions: false,
            title: 'Email Verification',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                SignInView.routeName,
                (route) => false,
              );
            },
          ),
          body: EmailVerificationViewBodyBlocConsumer(userEmail: userEmail),
        ),
      ),
    );
  }
}
