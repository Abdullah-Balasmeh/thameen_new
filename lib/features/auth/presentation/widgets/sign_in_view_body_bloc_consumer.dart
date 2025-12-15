import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_in_cubit/sign_in_cubit.dart';
import 'package:thameen/features/auth/presentation/views/email_verification_view.dart';
import 'package:thameen/features/auth/presentation/widgets/sign_in_view_body.dart';
import 'package:thameen/features/base/presentation/views/base_view.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          context.read<SignInCubit>().checkEmailVerificationStatus().then((
            value,
          ) {
            if (value) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BaseView.routeName,
                (route) => false,
              );
            } else {
              context.read<SignInCubit>().sendOtp(state.user.email);
              Navigator.pushNamedAndRemoveUntil(
                context,
                EmailVerificationView.routeName,
                arguments: state.user.email,
                (route) => false,
              );
            }
          });
        }
        if (state is SignInFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return const SignInViewBody();
      },
    );
  }
}
