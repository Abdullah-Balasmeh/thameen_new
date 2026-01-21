import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class SearchingIndicator extends StatelessWidget {
  const SearchingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 3,
        ),
        SizedBox(height: 16),
        Text(
          'AI is analyzing...',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Finding matching items',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
