import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

Color getMatchColor(double percentage) {
  if (percentage >= 80) return const Color(0xFF4CAF50);
  if (percentage >= 60) return AppColors.primary;
  if (percentage >= 40) return const Color(0xFFFF9800);
  if (percentage >= 20) return Colors.yellowAccent;
  return Colors.grey;
}
