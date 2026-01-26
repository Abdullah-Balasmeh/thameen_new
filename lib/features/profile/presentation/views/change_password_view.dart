import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/profile/domain/repo/change_password_repo.dart';
import 'package:thameen/features/profile/presentation/bloc/change_password/change_password_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/change_password_view_body_bloc_consumer.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static const String routeName = 'change_password_view';
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
          title: S.of(context).changePasswordTitle,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: BlocProvider(
          create: (context) => ChangePasswordCubit(getIt<ChangePasswordRepo>()),
          child: const ChangePasswordViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
