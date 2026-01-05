import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/presentation/widgets/report_card.dart';

import 'update_status_bottom_sheet.dart';

class MyReportsViewBody extends StatefulWidget {
  const MyReportsViewBody({super.key});

  @override
  State<MyReportsViewBody> createState() => _MyReportsViewBodyState();
}

class _MyReportsViewBodyState extends State<MyReportsViewBody> {
  List<PostEntity> posts = [];

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  void _loadReports() {
    // Mock data - replace with actual API call
    setState(() {
      posts = [
        // ReportModel(
        //   id: '1',
        //   type: ReportType.lost,
        //   category: 'Pets',
        //   categoryIcon: '🐕',
        //   title: 'Golden Retriever Dog',
        //   description:
        //       'Lost my golden retriever near Central Park. Very friendly, answers to "Max". Has a blue collar with name tag.',
        //   location: 'Central Park, New York',
        //   timeAgo: '3 hours ago',
        //   status: ReportStatus.active,
        //   createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        // ),
        // ReportModel(
        //   id: '2',
        //   type: ReportType.found,
        //   category: 'Electronics',
        //   categoryIcon: '📱',
        //   title: 'iPhone 14 Pro',
        //   description:
        //       'Found an iPhone 14 Pro in black color at Starbucks on Main Street. Screen is cracked but phone is working.',
        //   location: 'Starbucks, Main Street',
        //   timeAgo: '1 hour ago',
        //   status: ReportStatus.active,
        //   createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        // ),
        // ReportModel(
        //   id: '3',
        //   type: ReportType.lost,
        //   category: 'Personal Items',
        //   categoryIcon: '👜',
        //   title: 'Black Leather Wallet',
        //   description:
        //       'Lost black leather wallet containing ID, credit cards, and some cash. Last seen at City Mall food court.',
        //   location: 'City Mall Food Court',
        //   timeAgo: '1 day ago',
        //   status: ReportStatus.active,
        //   createdAt: DateTime.now().subtract(const Duration(days: 1)),
        // ),
      ];
    });
  }

  void _showUpdateStatusSheet(PostEntity post) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => UpdateStatusBottomSheet(
        currentStatus: post.postState,
        onStatusChanged: (newStatus) {
          _updateReportStatus(post.id, newStatus);
        },
      ),
    );
  }

  void _updateReportStatus(String postId, PostState newStatus) {
    setState(() {
      final index = posts.indexWhere((r) => r.id == postId);
      if (index != -1) {
        posts[index] = posts[index].copyWith(postState: newStatus);
      }
    });
  }

  void _editReport(PostEntity post) {
    // TODO: Navigate to edit screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit functionality coming soon!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.list_alt,
              size: 80,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'No Reports Yet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTextStyle.medium14.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your lost & found reports will appear here',
              style: TextStyle(
                fontSize: 14,
                color: AppTextStyle.medium14.color,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final myPosts = posts[index];
        return ReportCard(
          post: myPosts,
          onUpdateStatus: () => _showUpdateStatusSheet(myPosts),
          onEdit: () => _editReport(myPosts),
        );
      },
    );
  }
}
