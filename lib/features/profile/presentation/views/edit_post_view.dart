import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/presentation/widgets/edit_post_view_body_bloc_consumer.dart';
import 'package:thameen/shared/widgets/app_bar.dart';

class EditPostView extends StatelessWidget {
  const EditPostView({super.key});
  static const String routeName = 'edit_post_view';
  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostEntity;
    log('post: ${post.itemName}');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          showButtonBack: true,
          showButtonActions: false,
          backgroundColor: AppColors.primary,
          title: 'Edit Post',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: EditPostViewBodyBlocConsumer(post: post),
      ),
    );
  }
}
