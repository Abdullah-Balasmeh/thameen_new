import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/features/post item/presentation/widgets/add_photo_button.dart';
import 'package:thameen/features/post item/presentation/widgets/photo_grid.dart';

class PhotoUpload extends StatelessWidget {
  const PhotoUpload({super.key, required this.selectedImages});

  final ValueNotifier<List<File>> selectedImages;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder(
      valueListenable: selectedImages,
      builder: (context, images, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              images.isEmpty
                  ? AddPhotoButton(selectedImages: selectedImages)
                  : PhotoGrid(
                      images: images,
                      onRemove: (i) {
                        images.removeAt(i);
                        selectedImages.notifyListeners();
                      },
                    ),

              if (images.isNotEmpty && images.length < 5) ...[
                const SizedBox(height: 12),
                AddPhotoButton(selectedImages: selectedImages),
              ],
            ],
          ),
        );
      },
    );
  }
}
