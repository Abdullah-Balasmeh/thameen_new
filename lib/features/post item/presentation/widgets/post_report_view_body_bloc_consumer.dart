import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/core/utils/helper/build_success_snackbar.dart';
import 'package:thameen/features/post%20item/presentation/bloc/create_post_cubit/create_post_cubit.dart';
import 'package:thameen/features/post%20item/presentation/widgets/post_report_view_body.dart';

class PostReportViewBodyBlocConsumer extends StatelessWidget {
  const PostReportViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostCubit, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostSuccess) {
          buildSuccessSnackBar(context, 'Report created successfully');
        }
        if (state is CreatePostFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return const PostReportViewBody();
      },
    );
  }
}
