import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: AppColors.lightBorder,
      width: 2,
    ),
  );
}

OutlineInputBorder buildFocusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: AppColors.primary,
      width: 2,
    ),
  );
}

OutlineInputBorder buildErrorBorder(
  BuildContext context,
) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: Theme.of(context).colorScheme.error,
      width: 1,
    ),
  );
}
