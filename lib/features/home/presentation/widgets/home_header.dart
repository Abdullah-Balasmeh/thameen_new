import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/theme/app_text_style.dart';
import 'package:thameen/features/home/presentation/widgets/stat_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: AppTextStyle.medium16.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'What did you lose or found today?',
            style: AppTextStyle.bold24.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              StatCard(title: 'Lost Items', count: '156', icon: Icons.search),
              SizedBox(width: 12),
              StatCard(title: 'Found Items', count: '89', icon: Icons.done_all),
            ],
          ),
        ],
      ),
    );
  }
}
