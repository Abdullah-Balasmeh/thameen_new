import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/generated/l10n.dart';

class NoReportsYet extends StatelessWidget {
  const NoReportsYet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.list_alt,
            size: 80,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).noReportsYet,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTextStyle.medium14.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).reportsWillAppearHere,
            style: TextStyle(
              fontSize: 14,
              color: AppTextStyle.medium14.color,
            ),
          ),
        ],
      ),
    );
  }
}
