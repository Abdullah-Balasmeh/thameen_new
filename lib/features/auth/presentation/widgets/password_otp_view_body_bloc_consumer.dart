import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:thameen/features/auth/presentation/views/new_password_view.dart';
import 'package:thameen/features/auth/presentation/widgets/password_otp_view_body.dart';

class PasswordOtpViewBodyBlocConsumer extends StatelessWidget {
  const PasswordOtpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is FPVerifySuccess) {
          Navigator.pushNamed(
            context,
            NewPasswordView.routeName,
            arguments: context.read<ForgotPasswordCubit>(),
          );
        }
        if (state is FPVerifyError) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return const PasswordOtpViewBody();
      },
    );
  }
}
