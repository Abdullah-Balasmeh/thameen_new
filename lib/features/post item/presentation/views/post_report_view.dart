import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/post%20item/domain/repositories/post_repository.dart';
import 'package:thameen/features/post%20item/presentation/bloc/create_post_cubit/create_post_cubit.dart';
import 'package:thameen/features/post%20item/presentation/widgets/post_report_view_body_bloc_consumer.dart';
import 'package:thameen/shared/services/firebase_storage.dart';
//import 'package:thameen/features/post_report/presentation/widgets/post_report_view_body.dart';

class PostReportView extends StatelessWidget {
  const PostReportView({super.key});
  static const String routeName = 'post_report';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePostCubit(
        postRepository: getIt<PostRepository>(),
        storageService: getIt<FirebaseStorageService>(),
      ),
      child: const PostReportViewBodyBlocConsumer(),
    );
  }
}
