import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/shared/services/image_picker_service.dart';

class EditProfilePhoto extends StatefulWidget {
  const EditProfilePhoto({
    super.key,
    this.currentImage,
    required this.newImage,
  });

  final String? currentImage;
  final ValueNotifier<File?> newImage;
  @override
  State<EditProfilePhoto> createState() => _EditProfilePhotoState();
}

class _EditProfilePhotoState extends State<EditProfilePhoto> {
  final imagePickerService = getIt<ImagePickerService>();

  Future<void> _pickImage() async {
    final picked = await imagePickerService.pickImage();
    if (picked == null) return;
    widget.newImage.value = picked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ValueListenableBuilder<File?>(
            valueListenable: widget.newImage,
            builder: (context, file, _) {
              if (file != null) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                );
              }

              // 2️⃣ إذا في صورة قديمة (photoUrl)
              if (widget.currentImage != null &&
                  widget.currentImage!.isNotEmpty) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    widget.currentImage!,
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                );
              }

              // 3️⃣ لا يوجد أي صورة
              return const Icon(
                Icons.person,
                size: 50,
                color: AppColors.primary,
              );
            },
          ),

          // زر التعديل
          Positioned(
            bottom: 0,
            right: 20,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.edit,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
