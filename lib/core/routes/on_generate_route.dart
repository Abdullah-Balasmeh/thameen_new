import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/di/service_locator.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/features/auth/presentation/bloc/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:thameen/features/auth/presentation/views/email_verification_view.dart';
import 'package:thameen/features/auth/presentation/views/forgot_password_view.dart';
import 'package:thameen/features/auth/presentation/views/new_password_view.dart';
import 'package:thameen/features/auth/presentation/views/password_otp_view.dart';
import 'package:thameen/features/auth/presentation/views/sign_in_view.dart';
import 'package:thameen/features/auth/presentation/views/sign_up_view.dart';
import 'package:thameen/features/auth/presentation/views/terms_condition_view.dart';
import 'package:thameen/features/base/presentation/views/base_view.dart';
import 'package:thameen/features/chat/presentation/views/chat_detail_view.dart';
import 'package:thameen/features/home/presentation/views/home_view.dart';
import 'package:thameen/features/home/presentation/views/post_detail_view.dart';
import 'package:thameen/features/onBoarding/presentation/views/on_boarding_view.dart';
import 'package:thameen/features/profile/presentation/views/about_view.dart';
import 'package:thameen/features/profile/presentation/views/change_password_view.dart';
import 'package:thameen/features/profile/presentation/views/edit_post_view.dart';
import 'package:thameen/features/profile/presentation/views/edit_profile_view.dart';
import 'package:thameen/features/profile/presentation/views/help_and_support_view.dart';
import 'package:thameen/features/profile/presentation/views/privacy_and_security.dart';
import 'package:thameen/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case TermsConditionView.routeName:
      return MaterialPageRoute(
        builder: (context) => const TermsConditionView(),
      );
    case EmailVerificationView.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const EmailVerificationView(),
      );
    case ForgotPasswordView.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => ForgotPasswordCubit(getIt<AuthRepo>()),
          child: const ForgotPasswordView(),
        ),
      );
    case PasswordOtpView.routeName:
      final cubit = settings.arguments as ForgotPasswordCubit;
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: const PasswordOtpView(),
        ),
      );
    case NewPasswordView.routeName:
      final cubit = settings.arguments as ForgotPasswordCubit;
      return MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: cubit,
          child: const NewPasswordView(),
        ),
      );
    case BaseView.routeName:
      return MaterialPageRoute(builder: (context) => const BaseView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case PostDetailView.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const PostDetailView(),
      );
    case ChatDetailView.routeName:
      final chatId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => ChatDetailView(
          chatId: chatId,
        ),
      );
    case EditPostView.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const EditPostView(),
      );
    case EditProfileView.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditProfileView(),
      );
    case HelpSupportView.routeName:
      return MaterialPageRoute(
        builder: (context) => const HelpSupportView(),
      );
    case PrivacySecurityView.routeName:
      return MaterialPageRoute(
        builder: (context) => const PrivacySecurityView(),
      );
    case AboutView.routeName:
      return MaterialPageRoute(
        builder: (context) => const AboutView(),
      );
    case ChangePasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChangePasswordView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const SplashView());
  }
}
