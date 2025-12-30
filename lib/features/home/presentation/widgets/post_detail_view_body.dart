import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/date_time_ex.dart';
import 'package:thameen/core/utils/helper/map_category_to_emoji.dart';
import 'package:thameen/features/home/presentation/widgets/post_detail_item_list_tile.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class PostDetailViewBody extends StatelessWidget {
  const PostDetailViewBody({
    super.key,
    required this.post,
    required this.posterName,
  });
  final PostEntity post;
  final String posterName;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: post.postType == PostType.lost
                        ? AppColors.error
                        : AppColors.success,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    post.postType == PostType.lost ? 'Lost' : 'Found',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppTextStyle.medium14.color,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Category
                Text(
                  '${mapCategoryToEmoji(post.itemCategory)} ${post.itemCategory}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTextStyle.medium14.color,
                  ),
                ),
                const Spacer(),
                // Status badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    post.postState.name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              post.itemName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTextStyle.medium14.color,
              ),
            ),
            const SizedBox(height: 16),
            // Item photos
            if (post.photoUrls.isNotEmpty)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: post.photoUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () {
                        // TODO: Open image in full screen
                        // Navigator.pushNamed(
                        //   context,
                        //   FullScreenImageView.routeName,
                        //   arguments: post.photoUrls[index],
                        // );
                      },
                      child: Image.network(
                        post.photoUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),

            const SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppTextStyle.medium14.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              post.itemDescription,
              style: AppTextStyle.medium14.copyWith(
                height: 1.6,
              ),
            ),

            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.person,
              label: 'Reported by',
              value: post.postAnonymously ? 'Anonymous' : posterName,
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.location_on,
              label: 'Location',
              value: post.location,
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.calendar_today,
              label: 'Reported Time',
              value: timeAgo(post.createdAt),
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.attach_money,
              label: 'Bounty',
              value: '${post.bountyAmount} JD',
            ),

            const SizedBox(height: 32),
            AppButton(
              onPressed: () {},
              child: Text('Contact Reporter', style: AppTextStyle.bold20),
            ),
          ],
        ),
      ),
    );
  }
}
