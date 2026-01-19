import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/chat/presentation/widgets/images_container.dart';
import 'package:thameen/features/chat/presentation/widgets/select_photo_source_container.dart';
import 'package:thameen/shared/services/image_picker_service.dart';

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({
    super.key,
    required this.chatId,
  });
  final String chatId;
  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  final imagePickerService = getIt<ImagePickerService>();
  List<File>? images;

  Future<void> pickImages() async {
    final picked = await imagePickerService.pickImages();
    if (picked.isNotEmpty) {
      setState(() {
        images = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return images == null
        ? SelectPhotoSourceContainer(
            onGalleryTap: pickImages,
            onCameraTap: () {},
          )
        : ImagesContainer(images: images!, chatId: widget.chatId);
  }
}
