import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
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
    final PosterEntity poster = arguments['poster'] as PosterEntity;
    log('post: ${post.itemName}');
    log('posterName: $poster');
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
      body: SafeArea(
        child: PostDetailViewBody(post: post, poster: poster),
      ),
    );
  }
}
