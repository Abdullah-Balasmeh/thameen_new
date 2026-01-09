import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/profile/domain/repo/my_reports_repo.dart';
import 'package:thameen/features/profile/presentation/bloc/myreports/my_reports_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/profile_view_body.dart';
import 'package:thameen/shared/services/firebase_storage.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyReportsCubit(
        getIt<MyReportsRepo>(),
        storageService: getIt<FirebaseStorageService>(),
      ),
      child: const ProfileViewBody(),
    );
  }
}
