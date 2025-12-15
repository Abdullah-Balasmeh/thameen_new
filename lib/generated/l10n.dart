// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get localeName {
    return Intl.message('en', name: 'localeName', desc: '', args: []);
  }

  /// `Skip`
  String get onboardingSkipButton {
    return Intl.message(
      'Skip',
      name: 'onboardingSkipButton',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboardingGetStartedButton {
    return Intl.message(
      'Get Started',
      name: 'onboardingGetStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get onboarding1Title {
    return Intl.message(
      'Welcome to ',
      name: 'onboarding1Title',
      desc: '',
      args: [],
    );
  }

  /// `Thameen`
  String get ThameenBlueTitle {
    return Intl.message(
      'Thameen',
      name: 'ThameenBlueTitle',
      desc: '',
      args: [],
    );
  }

  /// `What is Thameen? Thameen is an application that helps you find your lost items as easily as possible, connecting you to a world of lost items with just a click of a button.`
  String get onboarding1Subtitle {
    return Intl.message(
      'What is Thameen? Thameen is an application that helps you find your lost items as easily as possible, connecting you to a world of lost items with just a click of a button.',
      name: 'onboarding1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Communication in `
  String get onboarding2Title {
    return Intl.message(
      'Communication in ',
      name: 'onboarding2Title',
      desc: '',
      args: [],
    );
  }

  /// `High security? Private and end-to-end encrypted conversations between both parties within the app with trusted individuals, and all of that in complete safety.`
  String get onboarding2Subtitle {
    return Intl.message(
      'High security? Private and end-to-end encrypted conversations between both parties within the app with trusted individuals, and all of that in complete safety.',
      name: 'onboarding2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `AI in `
  String get onboarding3Title {
    return Intl.message('AI in ', name: 'onboarding3Title', desc: '', args: []);
  }

  /// `Thameen offers you the ability to search for images using AI with just a click, giving you the most relevant results available within the app.`
  String get onboarding3Subtitle {
    return Intl.message(
      'Thameen offers you the ability to search for images using AI with just a click, giving you the most relevant results available within the app.',
      name: 'onboarding3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signinTitle {
    return Intl.message('Sign In', name: 'signinTitle', desc: '', args: []);
  }

  /// `Email Address`
  String get signinEmailLabel {
    return Intl.message(
      'Email Address',
      name: 'signinEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signinPasswordLabel {
    return Intl.message(
      'Password',
      name: 'signinPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get signinForgotPasswordLink {
    return Intl.message(
      'Forgot Password?',
      name: 'signinForgotPasswordLink',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get signinRememberMeCheck {
    return Intl.message(
      'Remember Me',
      name: 'signinRememberMeCheck',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signinButton {
    return Intl.message('Sign In', name: 'signinButton', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get signinNoAccountText {
    return Intl.message(
      'Don\'t have an account?',
      name: 'signinNoAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Create One`
  String get signinCreateAccountLink {
    return Intl.message(
      'Create One',
      name: 'signinCreateAccountLink',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get signinErrorInvalidEmail {
    return Intl.message(
      'Enter a valid email',
      name: 'signinErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email Address is required`
  String get signinEmailAddressIsRequired {
    return Intl.message(
      'Email Address is required',
      name: 'signinEmailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get signinPasswordIsRequired {
    return Intl.message(
      'Password is required',
      name: 'signinPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signupTitle {
    return Intl.message(
      'Create Account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get signupFirstNameLabel {
    return Intl.message(
      'First Name',
      name: 'signupFirstNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get signupLastNameLabel {
    return Intl.message(
      'Last Name',
      name: 'signupLastNameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get signupPhoneLabel {
    return Intl.message(
      'Phone Number',
      name: 'signupPhoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get signupEmailLabel {
    return Intl.message(
      'Email Address',
      name: 'signupEmailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get signupPasswordLabel {
    return Intl.message(
      'Password',
      name: 'signupPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get signupConfirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'signupConfirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account you agree to our `
  String get signupTermsTextPrefix {
    return Intl.message(
      'By creating an account you agree to our ',
      name: 'signupTermsTextPrefix',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get signupTermsTextLink {
    return Intl.message(
      'Terms & Conditions',
      name: 'signupTermsTextLink',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signupButton {
    return Intl.message(
      'Create Account',
      name: 'signupButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signupAlreadyHaveAccountText {
    return Intl.message(
      'Already have an account?',
      name: 'signupAlreadyHaveAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signupSigninLink {
    return Intl.message(
      'Sign In',
      name: 'signupSigninLink',
      desc: '',
      args: [],
    );
  }

  /// `First name must be at least 2 characters`
  String get signupErrorFirstNameShort {
    return Intl.message(
      'First name must be at least 2 characters',
      name: 'signupErrorFirstNameShort',
      desc: '',
      args: [],
    );
  }

  /// `Last name must be at least 2 characters`
  String get signupErrorLastNameShort {
    return Intl.message(
      'Last name must be at least 2 characters',
      name: 'signupErrorLastNameShort',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get signupErrorEmailInvalid {
    return Intl.message(
      'Enter a valid email',
      name: 'signupErrorEmailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get signupErrorPasswordShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'signupErrorPasswordShort',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get signupErrorPasswordMismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'signupErrorPasswordMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number is required`
  String get PhoneNumberIsRequired {
    return Intl.message(
      'Phone Number is required',
      name: 'PhoneNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number format`
  String get InvalidPhoneNumberFormat {
    return Intl.message(
      'Invalid phone number format',
      name: 'InvalidPhoneNumberFormat',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must be 8 digits after +962 7`
  String get InvalidPhoneNumberDigits {
    return Intl.message(
      'Phone number must be 8 digits after +962 7',
      name: 'InvalidPhoneNumberDigits',
      desc: '',
      args: [],
    );
  }

  /// `Only digits allowed after +962 7`
  String get OnlyDigitsAllowed {
    return Intl.message(
      'Only digits allowed after +962 7',
      name: 'OnlyDigitsAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter, one number, and one special character`
  String get PasswordMustContain {
    return Intl.message(
      'Password must contain at least one uppercase letter, one number, and one special character',
      name: 'PasswordMustContain',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and conditions`
  String get signupAcceptTermsError {
    return Intl.message(
      'You must accept the terms and conditions',
      name: 'signupAcceptTermsError',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect.`
  String get invalidEmailOrPassword {
    return Intl.message(
      'The email or password is incorrect.',
      name: 'invalidEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred, please try again.`
  String get unexpectedErrorTryAgain {
    return Intl.message(
      'An unexpected error occurred, please try again.',
      name: 'unexpectedErrorTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Phone Number`
  String get verifyYourPhoneNumber {
    return Intl.message(
      'Verify Your Phone Number',
      name: 'verifyYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Email`
  String get verifyYourEmail {
    return Intl.message(
      'Verify Your Email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to your number`
  String get enter6DigitCode {
    return Intl.message(
      'Enter the 6-digit code sent to your number',
      name: 'enter6DigitCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 6-digit code sent to your email`
  String get enter6DigitCodeEmail {
    return Intl.message(
      'Enter the 6-digit code sent to your email',
      name: 'enter6DigitCodeEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid 6-digit OTP`
  String get enterValid6DigitCodeError {
    return Intl.message(
      'Please enter a valid 6-digit OTP',
      name: 'enterValid6DigitCodeError',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get otpCompleted {
    return Intl.message('Completed', name: 'otpCompleted', desc: '', args: []);
  }

  /// `Allowing to paste `
  String get allowingToPaste {
    return Intl.message(
      'Allowing to paste ',
      name: 'allowingToPaste',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPasswordViewTitle {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPasswordViewTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message('Verify', name: 'verifyButton', desc: '', args: []);
  }

  /// `Didn't receive the code?`
  String get didntReceiveCode {
    return Intl.message(
      'Didn\'t receive the code?',
      name: 'didntReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resendCode {
    return Intl.message('Resend', name: 'resendCode', desc: '', args: []);
  }

  /// `Don't worry, just write your email address and we will send you a verification code.`
  String get sendVerificationCodeInfo {
    return Intl.message(
      'Don\'t worry, just write your email address and we will send you a verification code.',
      name: 'sendVerificationCodeInfo',
      desc: '',
      args: [],
    );
  }

  /// `Create New Password`
  String get createNewPassword {
    return Intl.message(
      'Create New Password',
      name: 'createNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the new password for your account`
  String get enterNewPassword {
    return Intl.message(
      'Enter the new password for your account',
      name: 'enterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPasswordLabel {
    return Intl.message(
      'New Password',
      name: 'newPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get confirmNewPasswordLabel {
    return Intl.message(
      'Confirm New Password',
      name: 'confirmNewPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPasswordButton {
    return Intl.message(
      'Reset Password',
      name: 'resetPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Password has been reset successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password has been reset successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get resetPasswordErrorInvalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'resetPasswordErrorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Code Verification`
  String get codeVerification {
    return Intl.message(
      'Code Verification',
      name: 'codeVerification',
      desc: '',
      args: [],
    );
  }

  /// `OTP resent successfully`
  String get otpResentSuccessfully {
    return Intl.message(
      'OTP resent successfully',
      name: 'otpResentSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email such as: example@email.com`
  String get errorInvalidEmail {
    return Intl.message(
      'Please enter a valid email such as: example@email.com',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled by the administrator.`
  String get errorUserDisabled {
    return Intl.message(
      'This account has been disabled by the administrator.',
      name: 'errorUserDisabled',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is incorrect.`
  String get errorInvalidCredential {
    return Intl.message(
      'The email or password is incorrect.',
      name: 'errorInvalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with this email.`
  String get errorEmailAlreadyInUse {
    return Intl.message(
      'An account already exists with this email.',
      name: 'errorEmailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Weak password. Please choose a stronger one with at least 8 characters including an uppercase letter, a number, and a special character.`
  String get errorWeakPassword {
    return Intl.message(
      'Weak password. Please choose a stronger one with at least 8 characters including an uppercase letter, a number, and a special character.',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This type of sign-in is disabled. Please contact support.`
  String get errorOperationNotAllowed {
    return Intl.message(
      'This type of sign-in is disabled. Please contact support.',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Check your network and try again.`
  String get errorNetworkRequestFailed {
    return Intl.message(
      'No internet connection. Check your network and try again.',
      name: 'errorNetworkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please wait and try again.`
  String get errorTooManyRequests {
    return Intl.message(
      'Too many attempts. Please wait and try again.',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `An internal server error occurred. Please try again later.`
  String get errorInternalError {
    return Intl.message(
      'An internal server error occurred. Please try again later.',
      name: 'errorInternalError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid API key. Please review your Firebase configuration.`
  String get errorInvalidApiKey {
    return Intl.message(
      'Invalid API key. Please review your Firebase configuration.',
      name: 'errorInvalidApiKey',
      desc: '',
      args: [],
    );
  }

  /// `This account was registered using a different sign-in method. Please use the correct provider.`
  String get errorAccountExistsWithDifferentCredential {
    return Intl.message(
      'This account was registered using a different sign-in method. Please use the correct provider.',
      name: 'errorAccountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `These credentials are already used by another account.`
  String get errorCredentialAlreadyInUse {
    return Intl.message(
      'These credentials are already used by another account.',
      name: 'errorCredentialAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `There was an error sending your data. Please check your input.`
  String get errorArgumentError {
    return Intl.message(
      'There was an error sending your data. Please check your input.',
      name: 'errorArgumentError',
      desc: '',
      args: [],
    );
  }

  /// `The login window was closed before the process was completed.`
  String get errorPopupClosedByUser {
    return Intl.message(
      'The login window was closed before the process was completed.',
      name: 'errorPopupClosedByUser',
      desc: '',
      args: [],
    );
  }

  /// `This domain is not authorized for external sign-in.`
  String get errorUnauthorizedDomain {
    return Intl.message(
      'This domain is not authorized for external sign-in.',
      name: 'errorUnauthorizedDomain',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in failed. Please try again.`
  String get errorSignInFailed {
    return Intl.message(
      'Sign-in failed. Please try again.',
      name: 'errorSignInFailed',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again later.`
  String get errorUnknown {
    return Intl.message(
      'An unknown error occurred. Please try again later.',
      name: 'errorUnknown',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
