import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _uuid = const Uuid();

  Future<List<String>> uploadPostImages({
    required String postId,
    required List<File> images,
  }) async {
    final List<String> urls = [];

    for (final image in images) {
      // استخراج الامتداد الحقيقي
      final extension = path.extension(image.path); // .jpg .png .webp

      final ref = _storage.ref(
        'posts/$postId/${_uuid.v4()}$extension',
      );

      final metadata = SettableMetadata(
        contentType: _contentType(extension),
      );

      await ref.putFile(image, metadata);
      final url = await ref.getDownloadURL();
      urls.add(url);
    }

    return urls;
  }

  /// تحديد نوع الملف تلقائيًا
  String _contentType(String extension) {
    switch (extension.toLowerCase()) {
      case '.jpg':
      case '.jpeg':
        return 'image/jpeg';
      case '.png':
        return 'image/png';
      case '.webp':
        return 'image/webp';
      case '.heic':
        return 'image/heic';
      default:
        return 'image/*';
    }
  }

  Future<String> uploadProfileImage({
    required String userId,
    required File image,
  }) async {
    final extension = path.extension(image.path);

    final ref = _storage.ref(
      'profile_images/$userId/profile$extension',
    );

    final metadata = SettableMetadata(
      contentType: _contentType(extension),
    );

    await ref.putFile(image, metadata);

    return await ref.getDownloadURL();
  }
}
