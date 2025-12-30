import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/date_time_ex.dart';
import 'package:thameen/core/utils/helper/map_category_to_emoji.dart';
import 'package:thameen/features/home/presentation/bloc/all_posts_cubit/home_cubit.dart';
import 'package:thameen/features/home/presentation/views/post_detail_view.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.post});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final posterName = await context.read<HomeCubit>().getPosterNameById(
          post.userId,
        );
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            PostDetailView.routeName,
            arguments: {
              'post': post,
              'posterName': posterName,
            },
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.darkBackground.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: post.photoUrls.isEmpty
                ? Icon(
                    Icons.image_outlined,
                    color: Colors.grey[400],
                    size: 30,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      post.photoUrls.first,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          title: Text(
            post.itemName,
            style: AppTextStyle.bold20,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    mapCategoryToEmoji(post.itemCategory),
                    style: AppTextStyle.medium14.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    post.itemCategory,
                    style: AppTextStyle.medium14.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    post.location,
                    style: AppTextStyle.medium14.copyWith(
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                timeAgo(post.createdAt),
                style: AppTextStyle.medium14.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          trailing: Container(
            width: 50,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:
                  (post.postType == PostType.lost
                          ? AppColors.error
                          : AppColors.success)
                      .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              post.postType == PostType.lost ? 'Lost' : 'Found',
              style: AppTextStyle.medium14.copyWith(
                color: post.postType == PostType.lost
                    ? AppColors.error
                    : AppColors.success,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
