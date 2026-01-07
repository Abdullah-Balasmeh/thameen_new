import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/core/utils/extuntions/date_time_ex.dart';
import 'package:thameen/core/utils/helper/map_category_to_emoji.dart';
import 'package:thameen/features/chat/presentation/bloc/cubit/chat_cubit.dart';
import 'package:thameen/features/home/domain/entities/poster_entity.dart';
import 'package:thameen/features/home/presentation/widgets/contact_reporter_bottom_sheet.dart';
import 'package:thameen/features/home/presentation/widgets/post_detail_item_list_tile.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class PostDetailViewBody extends StatefulWidget {
  const PostDetailViewBody({
    super.key,
    required this.post,
    required this.poster,
  });
  final PostEntity post;
  final PosterEntity poster;

  @override
  State<PostDetailViewBody> createState() => _PostDetailViewBodyState();
}

class _PostDetailViewBodyState extends State<PostDetailViewBody> {
  final PageController pageController = PageController();

  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

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
                    color: widget.post.postType == PostType.lost
                        ? AppColors.error
                        : AppColors.success,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    widget.post.postType == PostType.lost ? 'Lost' : 'Found',
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
                  '${mapCategoryToEmoji(widget.post.itemCategory)} ${widget.post.itemCategory}',
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
                    widget.post.postState.name.toUpperCase(),
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
              widget.post.itemName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTextStyle.medium14.color,
              ),
            ),
            const SizedBox(height: 16),
            // Item photos
            if (widget.post.photoUrls.isNotEmpty)
              Container(
                height: 275,
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.post.photoUrls[index]),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                      heroAttributes: PhotoViewHeroAttributes(
                        tag: widget.post.photoUrls[index],
                      ),
                    );
                  },
                  itemCount: widget.post.photoUrls.length,
                  loadingBuilder: (context, event) => Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                  event.expectedTotalBytes!,
                      ),
                    ),
                  ),
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  pageController: pageController,
                  onPageChanged: onPageChanged,
                ),
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
              widget.post.itemDescription,
              style: AppTextStyle.medium14.copyWith(
                height: 1.6,
              ),
            ),

            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.person,
              label: 'Reported by',
              value: widget.post.postAnonymously
                  ? 'Anonymous'
                  : '${widget.poster.firstName} ${widget.poster.lastName}',
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.location_on,
              label: 'Location',
              value: widget.post.location,
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.calendar_today,
              label: 'Reported Time',
              value: timeAgo(widget.post.createdAt),
            ),
            const SizedBox(height: 16),
            DetailRow(
              icon: Icons.attach_money,
              label: 'Bounty',
              value: '${widget.post.bountyAmount} JD',
            ),

            const SizedBox(height: 32),
            AppButton(
              onPressed: () {
                final parentContext = context;

                showBottomSheet(
                  context: context,
                  builder: (_) => BlocProvider(
                    create: (_) => getIt<ChatCubit>(),
                    child: ContactReporterBottomSheet(
                      poster: widget.poster,
                      postId: widget.post.id,
                      parentContext: parentContext, // 👈 مهم
                    ),
                  ),
                );
              },

              child: Text('Contact Reporter', style: AppTextStyle.bold20),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
