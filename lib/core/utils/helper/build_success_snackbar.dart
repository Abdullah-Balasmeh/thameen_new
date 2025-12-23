import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

void buildSuccessSnackBar(BuildContext context, String errMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.success,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),

      content: Text(
        errMessage,
        style: AppTextStyle.medium16.copyWith(color: Colors.white),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
