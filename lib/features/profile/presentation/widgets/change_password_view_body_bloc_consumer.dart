import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/features/auth/presentation/widgets/showSuccessDialog.dart';
import 'package:thameen/features/profile/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/change_password_view_body.dart';

class ChangePasswordViewBodyBlocConsumer extends StatelessWidget {
  const ChangePasswordViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordSuccess) {
          showSuccessDialog(
            context,
            'Password changed successfully',
          );
        }
        if (state is ChangePasswordFailure) {
          log('ChangePasswordFailure: ${state.errMessage}');
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return const ChangePasswordViewBody();
      },
    );
  }
}
