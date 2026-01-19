import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/chat/presentation/widgets/chat_bottom_sheetIcon_container.dart';

class SelectPhotoSourceContainer extends StatelessWidget {
  const SelectPhotoSourceContainer({
    super.key,
    required this.onGalleryTap,
    required this.onCameraTap,
  });
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text('Select Photo Source', style: AppTextStyle.bold24),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChatBottomSheetIconContainer(
                icon: Icons.photo_library,
                label: 'Gallery',
                onTap: onGalleryTap,
              ),
              const SizedBox(width: 16),
              ChatBottomSheetIconContainer(
                icon: Icons.camera_alt,
                label: 'Camera',
                onTap: onCameraTap,
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
