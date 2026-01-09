import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/profile/presentation/bloc/myreports/my_reports_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/my_reports_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class MyReportsView extends StatefulWidget {
  const MyReportsView({super.key});

  @override
  State<MyReportsView> createState() => _MyReportsViewState();
}

class _MyReportsViewState extends State<MyReportsView> {
  @override
  void initState() {
    super.initState();
    context.read<MyReportsCubit>().getMyReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: buildAppBar(
        context,
        showButtonBack: true,
        showButtonActions: false,
        title: 'My Reports',
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const MyReportsViewBodyBlocConsumer(),
    );
  }
}
