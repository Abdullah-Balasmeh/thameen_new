import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/auth/presentation/widgets/new_password_view_body.dart';

class NewPasswordViewBodyBlocConsumer extends StatelessWidget {
  const NewPasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is FPResetSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInView.routeName,
            (route) => false,
          );
        }
        if (state is FPResetError) {
          buildErrorSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        return const NewPasswordViewBody();
      },
    );
  }
}
