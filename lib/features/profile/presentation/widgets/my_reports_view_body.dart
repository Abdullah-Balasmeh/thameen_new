import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/presentation/widgets/report_card.dart';

class MyReportsViewBody extends StatefulWidget {
  const MyReportsViewBody({super.key, required this.posts});
  final List<PostEntity> posts;
  @override
  State<MyReportsViewBody> createState() => _MyReportsViewBodyState();
}

class _MyReportsViewBodyState extends State<MyReportsViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final myPost = widget.posts[index];
        return ReportCard(
          post: myPost,
        );
      },
    );
  }
}
