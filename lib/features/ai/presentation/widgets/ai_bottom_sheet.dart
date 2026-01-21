import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/chat/presentation/widgets/select_photo_source_container.dart';
import 'package:thameen/shared/services/image_picker_service.dart';

class AiBottomSheet extends StatefulWidget {
  const AiBottomSheet({super.key, required this.image});
  final ValueNotifier<File?> image;
  @override
  State<AiBottomSheet> createState() => _AiBottomSheetState();
}

class _AiBottomSheetState extends State<AiBottomSheet> {
  final imagePickerService = getIt<ImagePickerService>();

  Future<void> pickImage() async {
    final picked = await imagePickerService.pickImage();
    if (picked != null) {
      widget.image.value = picked;

      // 👇 أغلق الـ BottomSheet
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectPhotoSourceContainer(
      onGalleryTap: () {
        pickImage();
      },
      onCameraTap: () {},
    );
  }
}
