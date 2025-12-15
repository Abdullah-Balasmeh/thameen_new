import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker picker;
  ImagePickerService(this.picker);
  final List<File> selectedImages = [];

  Future<List<File>> pickImages() async {
    final pickedFiles = await picker.pickMultiImage(
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 80,
    );
    await getLostData();
    if (pickedFiles.isEmpty) return selectedImages;

    final limited = pickedFiles.take(5 - selectedImages.length);

    selectedImages.addAll(limited.map((e) => File(e.path)));

    return selectedImages.toList();
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      selectedImages.addAll(files.map((e) => File(e.path)));
    } else {
      throw response.exception!;
    }
  }
}
