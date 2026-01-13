import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/profile/domain/edit_profile_repo.dart';
import 'package:thameen/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_profile_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const String routeName = 'edit_profile_view';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          backgroundColor: AppColors.primary,
          title: 'Edit Profile',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocProvider(
          create: (context) =>
              EditProfileCubit(getIt<EditProfileRepo>())..getUser(),
          child: const EditProfileViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
