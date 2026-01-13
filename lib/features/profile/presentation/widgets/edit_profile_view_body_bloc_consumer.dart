import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_view_body.dart';

class EditProfileViewBodyBlocConsumer extends StatelessWidget {
  const EditProfileViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is EditProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is EditProfileFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state is EditProfileSuccess) {
          return EditProfileViewBody(user: state.user);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
