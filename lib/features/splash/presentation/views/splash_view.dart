import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:thameen/core/constants/shared_pref_constants.dart';
import 'package:thameen/core/utils/assets.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/base/presentation/views/base_view.dart';
import 'package:thameen/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Assets.imagesLogoGif,
      nextScreen: executeNavigation(),
      duration: 3000,
      splashIconSize: 350,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Widget executeNavigation() {
    final bool isSeen = SharedPreferencesSingleton.getBool(isOnboardingSeen);
    final bool isRememberMe = SharedPreferencesSingleton.getBool(kisRememberMe);
    if (isSeen) {
      if (isRememberMe) {
        return const BaseView();
      } else {
        return const SignInView();
      }
    }
    return const OnBoardingView();
  }
}
