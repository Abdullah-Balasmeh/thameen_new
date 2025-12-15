import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/bloc/email_verification/email_verification_cubit.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/auth/presentation/widgets/email_verification_view_body.dart';

class EmailVerificationViewBodyBlocConsumer extends StatelessWidget {
  const EmailVerificationViewBodyBlocConsumer({
    super.key,
    required this.userEmail,
  });

  final String userEmail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            SignInView.routeName,
            (route) => false,
          );
        }
        if (state is EmailVerificationFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return EmailVerificationViewBody(userEmail: userEmail);
      },
    );
  }
}
