import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/ai/presentation/bloc/ai/ai_cubit.dart';
import 'package:thameen/features/ai/presentation/widgets/ai_bottom_sheet.dart';
import 'package:thameen/features/ai/presentation/widgets/photo_ready.dart';
import 'package:thameen/features/ai/presentation/widgets/searching_indecator.dart';
import 'package:thameen/features/ai/presentation/widgets/upload_photo_to_search.dart';
import 'package:thameen/shared/widgets/app_button.dart';

class PhotoUploadSection extends StatefulWidget {
  const PhotoUploadSection({
    super.key,
  });

  @override
  State<PhotoUploadSection> createState() => _PhotoUploadSectionState();
}

class _PhotoUploadSectionState extends State<PhotoUploadSection> {
  final ValueNotifier<File?> image = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AiSearchCubit, AiSearchState>(
      listener: (context, state) {
        if (state is AiSearchInitial) {
          image.value = null; // ✅ امسح الصورة
        }
      },
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    bool isSearching = context.select(
      (AiSearchCubit cubit) => cubit.isSearching,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ValueListenableBuilder<File?>(
        valueListenable: image,
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
                          showModalBottomSheet(
                            context: context,
                            builder: (_) => AiBottomSheet(image: image),
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
                  child: const Text('Search'),
                  onPressed: () {
                    context.read<AiSearchCubit>().searchByImage(file);
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
