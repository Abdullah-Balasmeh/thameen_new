import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/features/post%20item/presentation/widgets/add_photo_button.dart';
import 'package:thameen/features/post%20item/presentation/widgets/photo_grid.dart';

class PhotoUpload extends StatelessWidget {
  const PhotoUpload({
    super.key,
    required this.existingImageUrls,
    required this.newImages,
  });

  final ValueNotifier<List<String>> existingImageUrls;
  final ValueNotifier<List<File>> newImages;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<dynamic>>(
      valueListenable: _PhotosNotifier(existingImageUrls, newImages),
      builder: (_, __, ___) {
        final total = existingImageUrls.value.length + newImages.value.length;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            children: [
              if (total > 0)
                PhotoGrid(
                  networkImages: existingImageUrls.value,
                  localImages: newImages.value,
                  onRemove: (index) {
                    if (index < existingImageUrls.value.length) {
                      existingImageUrls.value.removeAt(index);
                      existingImageUrls.notifyListeners();
                    } else {
                      newImages.value.removeAt(
                        index - existingImageUrls.value.length,
                      );
                      newImages.notifyListeners();
                    }
                  },
                ),

              const SizedBox(height: 12),

              if (total < 5)
                AddPhotoButton(
                  selectedImages: newImages,
                ),
            ],
          ),
        );
      },
    );
  }
}

class _PhotosNotifier extends ValueNotifier<List<dynamic>> {
  _PhotosNotifier(this.a, this.b) : super([]) {
    a.addListener(notifyListeners);
    b.addListener(notifyListeners);
  }

  final ValueNotifier a;
  final ValueNotifier b;
}
