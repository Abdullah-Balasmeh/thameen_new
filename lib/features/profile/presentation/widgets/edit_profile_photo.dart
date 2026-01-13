import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';

class EditProfilePhoto extends StatelessWidget {
  const EditProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 50,
            color: AppColors.primary,
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.edit,
                size: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
