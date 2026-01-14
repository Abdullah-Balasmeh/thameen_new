import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/core/utils/helper/build_success_snackbar.dart';
import 'package:thameen/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileViewBodyBlocConsumer extends StatelessWidget {
  const EditProfileViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileUpdateSuccess) {
          buildSuccessSnackBar(context, 'Profile updated successfully');
        }
        if (state is EditProfileFailure) {
          log('EditProfileFailure: ${state.errMessage}');
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is EditProfileSuccess) {
          return EditProfileViewBody(user: state.user);
        }
        if (state is EditProfileUpdateSuccess) {
          return EditProfileViewBody(user: state.user);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
