import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 1,
      height: 1,
      color: AppColors.lightBorder,
      indent: 4,
      endIndent: 4,
    );
  }
}
