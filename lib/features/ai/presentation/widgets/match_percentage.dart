import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class MatchPercentage extends StatelessWidget {
  const MatchPercentage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '80% Match',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.success,
      ),
    );
  }
}
