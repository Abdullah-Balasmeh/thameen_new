import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class ReportCard extends StatelessWidget {
  final PostEntity post;
  final VoidCallback onUpdateStatus;
  final VoidCallback onEdit;

  const ReportCard({
    super.key,
    required this.post,
    required this.onUpdateStatus,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with type, category, and time
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: post.postType == PostType.lost
                        ? const Color(0xFFFFEBEE)
                        : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    post.postType == PostType.lost ? 'LOST' : 'FOUND',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: post.postType == PostType.lost
                          ? AppColors.error
                          : AppColors.success,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Category
                Text(
                  post.itemCategory,
                  style: AppTextStyle.medium14,
                ),
                const Spacer(),
                // Time ago
                Text(
                  '${post.createdAt}',
                  style: AppTextStyle.medium12.copyWith(
                    color: AppTextStyle.medium14.color,
                  ),
                ),
              ],
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post.itemName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTextStyle.bold20.color,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post.itemDescription,
              style: AppTextStyle.medium14.copyWith(
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Location
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 14,
                  color: AppColors.error,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    post.location,
                    style: AppTextStyle.medium14,
                  ),
                ),
                //
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Action buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onUpdateStatus,
                    icon: const Icon(Icons.refresh, size: 18),
                    label: const Text('Update Status'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: 18),
                    label: const Text('Edit'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
