import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/home/domain/repositories/home_repo.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: const HomeViewBody(),
    );
  }
}
