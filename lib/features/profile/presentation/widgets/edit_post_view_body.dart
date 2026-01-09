import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/presentation/widgets/post_edit_form.dart';

class EditPostViewBody extends StatelessWidget {
  const EditPostViewBody({super.key, required this.post});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            PostEditForm(post: post),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
