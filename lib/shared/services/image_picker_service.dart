import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker picker;
  ImagePickerService(this.picker);

  Future<List<File>> pickImages({int limit = 5}) async {
    final pickedFiles = await picker.pickMultiImage(
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 80,
    );

    if (pickedFiles.isEmpty) return [];

    return pickedFiles.take(limit).map((e) => File(e.path)).toList();
  }

  Future<File?> pickImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 900,
      maxHeight: 900,
      imageQuality: 80,
    );
    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }
}
