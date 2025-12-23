import 'package:flutter/material.dart';
import 'package:thameen/core/constants/app_spacing.dart';
import 'package:thameen/core/constants/shared_pref_constants.dart';
import 'package:thameen/core/theme/app_colors.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/dot_indicator.dart';
import 'package:thameen/features/onBoarding/presentation/widgets/on_boarding_page_view.dart';
import 'package:thameen/generated/l10n.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';
import 'package:thameen/shared/widgets/app_button.dart';
import 'package:thameen/shared/widgets/switch_mode_and_language.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.kPaddingHorizontal,
      ),
      child: Column(
        children: [
          const SwitchModeAndLanguage(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  SharedPreferencesSingleton.setBool(isOnboardingSeen, true);
                  Navigator.pushReplacementNamed(context, SignInView.routeName);
                },
                child: Text(
                  S.of(context).onboardingSkipButton,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.primary),
                ),
              ),
            ],
          ),
          const Spacer(),
          OnBoardingPageView(pageController: pageController),
          const Spacer(),
          DotIndicator(pageController: pageController),
          const SizedBox(height: 32),
          Visibility(
            visible: currentPage == 2,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            maintainSemantics: true,
            maintainInteractivity: true,
            child: AppButton(
              child: Text(
                S.of(context).onboardingGetStartedButton,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: AppColors.darkTextPrimary,
                ),
              ),
              onPressed: () {
                SharedPreferencesSingleton.setBool(isOnboardingSeen, true);
                Navigator.pushReplacementNamed(context, SignInView.routeName);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.bottom),
        ],
      ),
    );
  }
}
