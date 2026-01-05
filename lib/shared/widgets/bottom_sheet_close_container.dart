import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class BottomSheetCloseContainer extends StatelessWidget {
  const BottomSheetCloseContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
