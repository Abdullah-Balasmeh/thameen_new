import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/generated/l10n.dart';

class NoReportsFound extends StatelessWidget {
  const NoReportsFound({super.key, this.isAi = false});
  final bool? isAi;
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
            isAi == true
                ? 'No Strong Matches Found'
                : S.of(context).noReportsYet,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTextStyle.medium14.color,
            ),
          ),
        ],
      ),
    );
  }
}
