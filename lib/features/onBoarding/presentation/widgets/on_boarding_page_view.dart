import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/on_boarding_page_view_item.dart';
import 'package:thameen/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      children: [
        OnBoardingPageViewItem(
          image: Assets.imagesOnboarding1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboarding1Title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                S.of(context).ThameenBlueTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          description: S.of(context).onboarding1Subtitle,
        ),
        OnBoardingPageViewItem(
          image: Assets.imagesOnboarding2,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboarding2Title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                S.of(context).ThameenBlueTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          description: S.of(context).onboarding2Subtitle,
        ),
        OnBoardingPageViewItem(
          image: Assets.imagesOnboarding3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).onboarding3Title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                S.of(context).ThameenBlueTitle,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          description: S.of(context).onboarding3Subtitle,
        ),
      ],
    );
  }
}
