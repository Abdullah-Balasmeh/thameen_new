import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
  });
  final String title;
  final String count;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightSurface.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.lightSurface, size: 28),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  count,
                  style: AppTextStyle.bold24.copyWith(
                    color: AppColors.lightSurface,
                  ),
                ),
                Text(
                  title,
                  style: AppTextStyle.medium14.copyWith(
                    color: AppColors.lightSurface,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
