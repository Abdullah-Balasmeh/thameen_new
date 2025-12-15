import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:thameen/features/auth/presentation/views/password_otp_view.dart';
import 'package:thameen/features/auth/presentation/widgets/forgot_password_view_body.dart';

class ForgotPasswordViewBodyBlocConsumer extends StatelessWidget {
  const ForgotPasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is FPEmailSent) {
          Navigator.pushNamed(
            context,
            PasswordOtpView.routeName,
            arguments: context.read<ForgotPasswordCubit>(),
          );
        }
        if (state is FPEmailError) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return const ForgotPasswordViewBody();
      },
    );
  }
}
