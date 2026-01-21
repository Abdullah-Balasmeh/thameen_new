import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/ai/presentation/widgets/pro_tips_section.dart';

class ReadyToSearchSection extends StatelessWidget {
  const ReadyToSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.darkSurfaceElevated.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.video_camera_back_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Ready to search',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTextStyle.medium14.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Upload a photo to start finding matching\nlost and found items',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppTextStyle.medium14.color,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          const ProTipsSection(),
        ],
      ),
    );
  }
}
