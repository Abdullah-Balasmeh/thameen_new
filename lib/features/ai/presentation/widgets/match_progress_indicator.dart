import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class MatchProgressIndicator extends StatelessWidget {
  const MatchProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: LinearProgressIndicator(
          value: 80 / 100,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.success,
          ),
          minHeight: 6,
        ),
      ),
    );
  }
}
