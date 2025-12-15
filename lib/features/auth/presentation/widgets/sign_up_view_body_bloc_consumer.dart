import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/sign_up_cubit/sign_up_cubit.dart';
import 'package:thameen/features/auth/presentation/views/email_verification_view.dart';
import 'package:thameen/features/auth/presentation/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          String userEmail = state.user.email;
          context.read<SignUpCubit>().sendOtp(userEmail);
          Navigator.pushReplacementNamed(
            context,
            EmailVerificationView.routeName,
            arguments: userEmail,
          );
        }
        if (state is SignUpFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }
}
