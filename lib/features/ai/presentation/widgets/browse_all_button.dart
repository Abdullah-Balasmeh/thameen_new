import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class BrowseAllButton extends StatelessWidget {
  const BrowseAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Browse all
      },
      icon: const Icon(Icons.list),
      label: const Text('Browse All Items'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
