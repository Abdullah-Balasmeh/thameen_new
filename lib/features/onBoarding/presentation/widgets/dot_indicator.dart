import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:thameen/core/theme/app_colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 3,
      effect: const JumpingDotEffect(
        jumpScale: 1,
        verticalOffset: 10,
        spacing: 10,
        dotHeight: 10,
        dotWidth: 10,
        activeDotColor: AppColors.primary,
        dotColor: AppColors.darkTextSecondary,
      ),
    );
  }
}
