import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_bottom_sheet.dart';
import 'package:thameen/features/ai/presentation/widgets/photo_ready.dart';
import 'package:thameen/features/ai/presentation/widgets/searching_indecator.dart';
import 'package:thameen/features/ai/presentation/widgets/upload_photo_to_search.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class PhotoUploadSection extends StatefulWidget {
  const PhotoUploadSection({super.key, required this.image});
  final ValueNotifier<File?> image;

  @override
  State<PhotoUploadSection> createState() => _PhotoUploadSectionState();
}

class _PhotoUploadSectionState extends State<PhotoUploadSection> {
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkSurfaceElevated.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ValueListenableBuilder<File?>(
        valueListenable: widget.image,
        builder: (context, file, _) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.darkBackground.withValues(alpha: 0.05)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 2,
                  ),
                ),
                child: file == null
                    ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (context) =>
                                AiBottomSheet(image: widget.image),
                          );
                        },
                        child: const UploadPhotoToSearch(),
                      )
                    : isSearching
                    ? const SearchingIndicator()
                    : PhotoReady(image: file),
              ),

              if (file != null) ...[
                const SizedBox(height: 20),
                AppButton(
                  child: Text(
                    'Search',
                    style: AppTextStyle.bold20,
                  ),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
