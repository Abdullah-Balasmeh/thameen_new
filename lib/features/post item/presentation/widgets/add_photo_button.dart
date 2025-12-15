import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/shared/services/image_picker_service.dart';

class AddPhotoButton extends StatefulWidget {
  const AddPhotoButton({super.key, required this.selectedImages});

  final ValueNotifier<List<File>> selectedImages;

  @override
  State<AddPhotoButton> createState() => _AddPhotoButtonState();
}

class _AddPhotoButtonState extends State<AddPhotoButton> {
  final imagePickerService = getIt<ImagePickerService>();

  @override
  Widget build(BuildContext context) {
    final images = widget.selectedImages.value;

    return Column(
      children: [
        Center(
          child: Text(
            'Upload photos of the item (up to 5)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
        ),
        const SizedBox(height: 16),

        OutlinedButton.icon(
          onPressed: _pickImages,
          icon: const Icon(Icons.add_photo_alternate),
          label: Text(images.isEmpty ? 'Add Photos' : 'Add More'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImages() async {
    try {
      final currentImages = widget.selectedImages.value;

      if (currentImages.length >= 5) {
        _showSnack('You can only upload up to 5 images.');
        return;
      }

      final updatedList = await imagePickerService.pickImages();

      widget.selectedImages.value = updatedList;
    } catch (e) {
      log('Error picking images: $e');
      _showSnack('Error picking images: $e');
    }
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }
}
