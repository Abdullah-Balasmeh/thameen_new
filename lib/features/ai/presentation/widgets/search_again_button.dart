import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class SearchAgainButton extends StatelessWidget {
  const SearchAgainButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        // TODO: Search again
      },
      icon: const Icon(Icons.refresh),
      label: const Text('Search Again'),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
