import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class UploadPhotoToSearch extends StatelessWidget {
  const UploadPhotoToSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud_upload_outlined,
          size: 60,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 12),
        Text(
          'Upload a photo to search',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppTextStyle.medium14.color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'AI will find matching items',
          style: TextStyle(
            fontSize: 13,
            color: AppTextStyle.medium14.color,
          ),
        ),
      ],
    );
  }
}
