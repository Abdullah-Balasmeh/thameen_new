import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/profile/presentation/bloc/myreports/my_reports_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/my_reports_view_body.dart';
import 'package:thameen/features/profile/presentation/widgets/no_reports_yet.dart';

class MyReportsViewBodyBlocConsumer extends StatelessWidget {
  const MyReportsViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyReportsCubit, MyReportsState>(
      listener: (context, state) {
        if (state is MyReportsInitial) {
          log('MyReportsInitial');
        }
        if (state is MyReportsFailure) {
          log('UpdateReportFailure');
        }
        if (state is MyReportsLoading) {
          log('MyReportsLoading');
        }
        if (state is MyReportsSuccess) {
          log('MyReportsSuccess');
        }
      },
      builder: (context, state) {
        if (state is MyReportsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MyReportsFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (state is MyReportsSuccess) {
          var posts = state.posts;
          if (posts.isEmpty) {
            return const NoReportsYet();
          }
          return MyReportsViewBody(posts: posts);
        }
        return const NoReportsYet();
      },
    );
  }
}
