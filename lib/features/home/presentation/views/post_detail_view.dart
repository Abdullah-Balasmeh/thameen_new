import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/home/presentation/widgets/post_detail_view_body.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({super.key});
  static const String routeName = 'post_detail_view';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final post = arguments['post'] as PostEntity;
    final posterName = arguments['posterName'] as String;
    log('post: ${post.itemName}');
    log('posterName: $posterName');
    return Scaffold(
      appBar: buildAppBar(
        context,
        backgroundColor: AppColors.primary,
        showButtonBack: true,
        showButtonActions: false,
        title: 'Post Detail',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: PostDetailViewBody(post: post, posterName: posterName),
    );
  }
}
