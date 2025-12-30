import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class RecentItems extends StatelessWidget {
  const RecentItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Items',
                style: AppTextStyle.bold24.copyWith(
                  color: AppColors.primary,
                ),
              ),
              TextButton(
                onPressed: () {
                  // View all
                },
                child: Text(
                  'View All',
                  style: AppTextStyle.medium16.copyWith(
                    color: AppColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
