import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/utils/helper/build_error_snackbar.dart';
import 'package:thameen/core/utils/helper/build_success_snackbar.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/presentation/bloc/myreports/my_reports_cubit.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_post_view_body.dart';

class EditPostViewBodyBlocConsumer extends StatelessWidget {
  const EditPostViewBodyBlocConsumer({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyReportsCubit, MyReportsState>(
      listener: (context, state) {
        if (state is UpdateReportSuccess) {
          buildSuccessSnackBar(context, 'Report updated successfully');
        }
        if (state is UpdateReportFailure) {
          buildErrorSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return EditPostViewBody(post: post);
      },
    );
  }
}
