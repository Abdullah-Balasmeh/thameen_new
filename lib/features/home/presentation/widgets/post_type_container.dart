import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';

class PostTypeContainer extends StatelessWidget {
  const PostTypeContainer({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              label,
              style: isSelected
                  ? AppTextStyle.medium16.copyWith(
                      color: Colors.white,
                    )
                  : AppTextStyle.medium16.copyWith(
                      color: Colors.black,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}