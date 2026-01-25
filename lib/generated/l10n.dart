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

  /// `Don't have an account? `
  String get signinNoAccountText {
    return Intl.message(
      'Don\'t have an account? ',
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

  /// `Sign In With Google`
  String get signinWithGoogleButton {
    return Intl.message(
      'Sign In With Google',
      name: 'signinWithGoogleButton',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Facebook`
  String get signinWithFacebookButton {
    return Intl.message(
      'Sign In With Facebook',
      name: 'signinWithFacebookButton',
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

  /// `or`
  String get signinOrDivider {
    return Intl.message('or', name: 'signinOrDivider', desc: '', args: []);
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

  /// `Already have an account? `
  String get signupAlreadyHaveAccountText {
    return Intl.message(
      'Already have an account? ',
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

  /// `Allowing to paste`
  String get allowingToPaste {
    return Intl.message(
      'Allowing to paste',
      name: 'allowingToPaste',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message('Verify', name: 'verifyButton', desc: '', args: []);
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

  /// `Weak password. Please choose a stronger one.`
  String get errorWeakPassword {
    return Intl.message(
      'Weak password. Please choose a stronger one.',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This type of sign-in is disabled.`
  String get errorOperationNotAllowed {
    return Intl.message(
      'This type of sign-in is disabled.',
      name: 'errorOperationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Check your network.`
  String get errorNetworkRequestFailed {
    return Intl.message(
      'No internet connection. Check your network.',
      name: 'errorNetworkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please wait.`
  String get errorTooManyRequests {
    return Intl.message(
      'Too many attempts. Please wait.',
      name: 'errorTooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `An internal server error occurred.`
  String get errorInternalError {
    return Intl.message(
      'An internal server error occurred.',
      name: 'errorInternalError',
      desc: '',
      args: [],
    );
  }

  /// `Invalid API key.`
  String get errorInvalidApiKey {
    return Intl.message(
      'Invalid API key.',
      name: 'errorInvalidApiKey',
      desc: '',
      args: [],
    );
  }

  /// `This account was registered using a different method.`
  String get errorAccountExistsWithDifferentCredential {
    return Intl.message(
      'This account was registered using a different method.',
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

  /// `There was an error sending your data.`
  String get errorArgumentError {
    return Intl.message(
      'There was an error sending your data.',
      name: 'errorArgumentError',
      desc: '',
      args: [],
    );
  }

  /// `The login window was closed.`
  String get errorPopupClosedByUser {
    return Intl.message(
      'The login window was closed.',
      name: 'errorPopupClosedByUser',
      desc: '',
      args: [],
    );
  }

  /// `This domain is not authorized.`
  String get errorUnauthorizedDomain {
    return Intl.message(
      'This domain is not authorized.',
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

  /// `An unknown error occurred.`
  String get errorUnknown {
    return Intl.message(
      'An unknown error occurred.',
      name: 'errorUnknown',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get welcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `What did you lose or find today?`
  String get whatDidYouLoseOrFindToday {
    return Intl.message(
      'What did you lose or find today?',
      name: 'whatDidYouLoseOrFindToday',
      desc: '',
      args: [],
    );
  }

  /// `Lost Items`
  String get lostItems {
    return Intl.message('Lost Items', name: 'lostItems', desc: '', args: []);
  }

  /// `Found Items`
  String get foundItems {
    return Intl.message('Found Items', name: 'foundItems', desc: '', args: []);
  }

  /// `Search for something...`
  String get searchForSomething {
    return Intl.message(
      'Search for something...',
      name: 'searchForSomething',
      desc: '',
      args: [],
    );
  }

  /// `Recent Items`
  String get recentItems {
    return Intl.message(
      'Recent Items',
      name: 'recentItems',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message('View All', name: 'viewAll', desc: '', args: []);
  }

  /// `Lost`
  String get lost {
    return Intl.message('Lost', name: 'lost', desc: '', args: []);
  }

  /// `Found`
  String get found {
    return Intl.message('Found', name: 'found', desc: '', args: []);
  }

  /// `days ago`
  String get daysAgo {
    return Intl.message('days ago', name: 'daysAgo', desc: '', args: []);
  }

  /// `hours ago`
  String get hoursAgo {
    return Intl.message('hours ago', name: 'hoursAgo', desc: '', args: []);
  }

  /// `AI Search`
  String get aiSearch {
    return Intl.message('AI Search', name: 'aiSearch', desc: '', args: []);
  }

  /// `Post Item`
  String get postItem {
    return Intl.message('Post Item', name: 'postItem', desc: '', args: []);
  }

  /// `Messages`
  String get messages {
    return Intl.message('Messages', name: 'messages', desc: '', args: []);
  }

  /// `Thameen`
  String get thameen {
    return Intl.message('Thameen', name: 'thameen', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Amman`
  String get amman {
    return Intl.message('Amman', name: 'amman', desc: '', args: []);
  }

  /// `Zarqa`
  String get zarqa {
    return Intl.message('Zarqa', name: 'zarqa', desc: '', args: []);
  }

  /// `Irbid`
  String get irbid {
    return Intl.message('Irbid', name: 'irbid', desc: '', args: []);
  }

  /// `Aqaba`
  String get aqaba {
    return Intl.message('Aqaba', name: 'aqaba', desc: '', args: []);
  }

  /// `Mafraq`
  String get mafraq {
    return Intl.message('Mafraq', name: 'mafraq', desc: '', args: []);
  }

  /// `Karak`
  String get karak {
    return Intl.message('Karak', name: 'karak', desc: '', args: []);
  }

  /// `Madaba`
  String get madaba {
    return Intl.message('Madaba', name: 'madaba', desc: '', args: []);
  }

  /// `Salt`
  String get salt {
    return Intl.message('Salt', name: 'salt', desc: '', args: []);
  }

  /// `Jerash`
  String get jerash {
    return Intl.message('Jerash', name: 'jerash', desc: '', args: []);
  }

  /// `Ajloun`
  String get ajloun {
    return Intl.message('Ajloun', name: 'ajloun', desc: '', args: []);
  }

  /// `Ma'an`
  String get maan {
    return Intl.message('Ma\'an', name: 'maan', desc: '', args: []);
  }

  /// `Tafilah`
  String get tafilah {
    return Intl.message('Tafilah', name: 'tafilah', desc: '', args: []);
  }

  /// `Balqa`
  String get balqa {
    return Intl.message('Balqa', name: 'balqa', desc: '', args: []);
  }

  /// `Ramtha`
  String get ramtha {
    return Intl.message('Ramtha', name: 'ramtha', desc: '', args: []);
  }

  /// `My Reports`
  String get myReports {
    return Intl.message('My Reports', name: 'myReports', desc: '', args: []);
  }

  /// `View your reports`
  String get viewYourReports {
    return Intl.message(
      'View your reports',
      name: 'viewYourReports',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get lightMode {
    return Intl.message('Light Mode', name: 'lightMode', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Support & Help`
  String get supportAndHelp {
    return Intl.message(
      'Support & Help',
      name: 'supportAndHelp',
      desc: '',
      args: [],
    );
  }

  /// `Security & Privacy`
  String get securityAndPrivacy {
    return Intl.message(
      'Security & Privacy',
      name: 'securityAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Support`
  String get support {
    return Intl.message('Support', name: 'support', desc: '', args: []);
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Profile updated successfully`
  String get profileUpdatedSuccessfully {
    return Intl.message(
      'Profile updated successfully',
      name: 'profileUpdatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `No Reports Yet`
  String get noReportsYet {
    return Intl.message(
      'No Reports Yet',
      name: 'noReportsYet',
      desc: '',
      args: [],
    );
  }

  /// `Your lost & found reports will appear here`
  String get reportsWillAppearHere {
    return Intl.message(
      'Your lost & found reports will appear here',
      name: 'reportsWillAppearHere',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Change Password`
  String get changePasswordTitle {
    return Intl.message(
      'Change Password',
      name: 'changePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfileTitle {
    return Intl.message(
      'Edit Profile',
      name: 'editProfileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your old password and create a new password`
  String get passwordInstruction {
    return Intl.message(
      'Enter your old password and create a new password',
      name: 'passwordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get oldPassword {
    return Intl.message(
      'Old Password',
      name: 'oldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpAndSupportTitle {
    return Intl.message(
      'Help & Support',
      name: 'helpAndSupportTitle',
      desc: '',
      args: [],
    );
  }

  /// `How can we help you?`
  String get howCanWeHelpYou {
    return Intl.message(
      'How can we help you?',
      name: 'howCanWeHelpYou',
      desc: '',
      args: [],
    );
  }

  /// `We're here to assist you with any questions`
  String get assistYouMessage {
    return Intl.message(
      'We\'re here to assist you with any questions',
      name: 'assistYouMessage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactUs {
    return Intl.message('Contact Us', name: 'contactUs', desc: '', args: []);
  }

  /// `Email Support`
  String get emailSupport {
    return Intl.message(
      'Email Support',
      name: 'emailSupport',
      desc: '',
      args: [],
    );
  }

  /// `support@thameenapp.com`
  String get supportEmail {
    return Intl.message(
      'support@thameenapp.com',
      name: 'supportEmail',
      desc: '',
      args: [],
    );
  }

  /// `Get help via email within 24 hours`
  String get emailResponseTime {
    return Intl.message(
      'Get help via email within 24 hours',
      name: 'emailResponseTime',
      desc: '',
      args: [],
    );
  }

  /// `Phone Support`
  String get phoneSupport {
    return Intl.message(
      'Phone Support',
      name: 'phoneSupport',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Support`
  String get whatsappSupport {
    return Intl.message(
      'WhatsApp Support',
      name: 'whatsappSupport',
      desc: '',
      args: [],
    );
  }

  /// `Chat with us instantly`
  String get chatWithUs {
    return Intl.message(
      'Chat with us instantly',
      name: 'chatWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Frequently Asked Questions`
  String get faq {
    return Intl.message(
      'Frequently Asked Questions',
      name: 'faq',
      desc: '',
      args: [],
    );
  }

  /// `How do I report a lost item?`
  String get reportLostItem {
    return Intl.message(
      'How do I report a lost item?',
      name: 'reportLostItem',
      desc: '',
      args: [],
    );
  }

  /// `How do I report a found item?`
  String get reportFoundItem {
    return Intl.message(
      'How do I report a found item?',
      name: 'reportFoundItem',
      desc: '',
      args: [],
    );
  }

  /// `How does the AI Search work?`
  String get aiSearchWork {
    return Intl.message(
      'How does the AI Search work?',
      name: 'aiSearchWork',
      desc: '',
      args: [],
    );
  }

  /// `Is my personal information safe?`
  String get isInfoSafe {
    return Intl.message(
      'Is my personal information safe?',
      name: 'isInfoSafe',
      desc: '',
      args: [],
    );
  }

  /// `How do I update my report status?`
  String get updateReportStatus {
    return Intl.message(
      'How do I update my report status?',
      name: 'updateReportStatus',
      desc: '',
      args: [],
    );
  }

  /// `Can I edit my posted item?`
  String get editPostedItem {
    return Intl.message(
      'Can I edit my posted item?',
      name: 'editPostedItem',
      desc: '',
      args: [],
    );
  }

  /// `Item Information`
  String get itemInformation {
    return Intl.message(
      'Item Information',
      name: 'itemInformation',
      desc: '',
      args: [],
    );
  }

  /// `Item Name`
  String get itemName {
    return Intl.message('Item Name', name: 'itemName', desc: '', args: []);
  }

  /// `Select Category`
  String get selectCategory {
    return Intl.message(
      'Select Category',
      name: 'selectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Item Description`
  String get itemDescription {
    return Intl.message(
      'Item Description',
      name: 'itemDescription',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Select City`
  String get selectCity {
    return Intl.message('Select City', name: 'selectCity', desc: '', args: []);
  }

  /// `Bounty (Optional)`
  String get bountyOptional {
    return Intl.message(
      'Bounty (Optional)',
      name: 'bountyOptional',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `Privacy`
  String get privacy {
    return Intl.message('Privacy', name: 'privacy', desc: '', args: []);
  }

  /// `Offer Bounty`
  String get offerBounty {
    return Intl.message(
      'Offer Bounty',
      name: 'offerBounty',
      desc: '',
      args: [],
    );
  }

  /// `Post Anonymously`
  String get postAnonymously {
    return Intl.message(
      'Post Anonymously',
      name: 'postAnonymously',
      desc: '',
      args: [],
    );
  }

  /// `Hide your identity from other users`
  String get hideIdentity {
    return Intl.message(
      'Hide your identity from other users',
      name: 'hideIdentity',
      desc: '',
      args: [],
    );
  }

  /// `Contact Methods`
  String get contactMethods {
    return Intl.message(
      'Contact Methods',
      name: 'contactMethods',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Phone`
  String get mobilePhone {
    return Intl.message(
      'Mobile Phone',
      name: 'mobilePhone',
      desc: '',
      args: [],
    );
  }

  /// `In-App Chat`
  String get inAppChat {
    return Intl.message('In-App Chat', name: 'inAppChat', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Photos (Up to 5) Optional`
  String get photosOptional {
    return Intl.message(
      'Photos (Up to 5) Optional',
      name: 'photosOptional',
      desc: '',
      args: [],
    );
  }

  /// `Upload photos of the item (up to 5)`
  String get uploadPhotos {
    return Intl.message(
      'Upload photos of the item (up to 5)',
      name: 'uploadPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Add Photos`
  String get addPhotos {
    return Intl.message('Add Photos', name: 'addPhotos', desc: '', args: []);
  }

  /// `Submit Report`
  String get submitReport {
    return Intl.message(
      'Submit Report',
      name: 'submitReport',
      desc: '',
      args: [],
    );
  }

  /// `No photos yet`
  String get noPhotosYet {
    return Intl.message(
      'No photos yet',
      name: 'noPhotosYet',
      desc: '',
      args: [],
    );
  }

  /// `Start capturing photos and videos`
  String get startCapturing {
    return Intl.message(
      'Start capturing photos and videos',
      name: 'startCapturing',
      desc: '',
      args: [],
    );
  }

  /// `Photos`
  String get photos {
    return Intl.message('Photos', name: 'photos', desc: '', args: []);
  }

  /// `Collections`
  String get collections {
    return Intl.message('Collections', name: 'collections', desc: '', args: []);
  }

  /// `Browse...`
  String get browse {
    return Intl.message('Browse...', name: 'browse', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Go to the 'Post Item' tab, select 'Lost', fill in the details including description, location, and photo, then submit.`
  String get howToReportLost {
    return Intl.message(
      'Go to the \'Post Item\' tab, select \'Lost\', fill in the details including description, location, and photo, then submit.',
      name: 'howToReportLost',
      desc: '',
      args: [],
    );
  }

  /// `Go to the 'Post Item' tab, select 'Found', provide details about the item you found, and wait for the owner to contact you.`
  String get howToReportFound {
    return Intl.message(
      'Go to the \'Post Item\' tab, select \'Found\', provide details about the item you found, and wait for the owner to contact you.',
      name: 'howToReportFound',
      desc: '',
      args: [],
    );
  }

  /// `Upload a photo of your lost item, and our AI will search through found items to find potential matches based on visual similarity.`
  String get howAiSearchWorks {
    return Intl.message(
      'Upload a photo of your lost item, and our AI will search through found items to find potential matches based on visual similarity.',
      name: 'howAiSearchWorks',
      desc: '',
      args: [],
    );
  }

  /// `Yes, we take privacy seriously. Your contact information is only shared when you choose to contact someone about an item.`
  String get privacyStatement {
    return Intl.message(
      'Yes, we take privacy seriously. Your contact information is only shared when you choose to contact someone about an item.',
      name: 'privacyStatement',
      desc: '',
      args: [],
    );
  }

  /// `Your Privacy Matters`
  String get yourPrivacyMatters {
    return Intl.message(
      'Your Privacy Matters',
      name: 'yourPrivacyMatters',
      desc: '',
      args: [],
    );
  }

  /// `We are committed to protecting your personal information`
  String get weProtectYourInfo {
    return Intl.message(
      'We are committed to protecting your personal information',
      name: 'weProtectYourInfo',
      desc: '',
      args: [],
    );
  }

  /// `Data Collection`
  String get dataCollection {
    return Intl.message(
      'Data Collection',
      name: 'dataCollection',
      desc: '',
      args: [],
    );
  }

  /// `What We Collect`
  String get whatWeCollect {
    return Intl.message(
      'What We Collect',
      name: 'whatWeCollect',
      desc: '',
      args: [],
    );
  }

  /// `We collect information you provide when creating an account (name, email, phone number), details about lost or found items you report, and photos you upload for AI search purposes.`
  String get whatWeCollectDescription {
    return Intl.message(
      'We collect information you provide when creating an account (name, email, phone number), details about lost or found items you report, and photos you upload for AI search purposes.',
      name: 'whatWeCollectDescription',
      desc: '',
      args: [],
    );
  }

  /// `How We Use Your Data`
  String get howWeUseYourData {
    return Intl.message(
      'How We Use Your Data',
      name: 'howWeUseYourData',
      desc: '',
      args: [],
    );
  }

  /// `Your information is used to: Facilitate connections between people who lost and found items, improve AI search, send notifications, and provide customer support.`
  String get howWeUseYourDataDetails {
    return Intl.message(
      'Your information is used to: Facilitate connections between people who lost and found items, improve AI search, send notifications, and provide customer support.',
      name: 'howWeUseYourDataDetails',
      desc: '',
      args: [],
    );
  }

  /// `Data Protection`
  String get dataProtection {
    return Intl.message(
      'Data Protection',
      name: 'dataProtection',
      desc: '',
      args: [],
    );
  }

  /// `Security Measures`
  String get securityMeasures {
    return Intl.message(
      'Security Measures',
      name: 'securityMeasures',
      desc: '',
      args: [],
    );
  }

  /// `We use industry-standard encryption. All communications are secured with SSL/TLS. Passwords are hashed and never stored in plain text.`
  String get securityMeasuresDescription {
    return Intl.message(
      'We use industry-standard encryption. All communications are secured with SSL/TLS. Passwords are hashed and never stored in plain text.',
      name: 'securityMeasuresDescription',
      desc: '',
      args: [],
    );
  }

  /// `Data Storage`
  String get dataStorage {
    return Intl.message(
      'Data Storage',
      name: 'dataStorage',
      desc: '',
      args: [],
    );
  }

  /// `Your data is stored on secure servers with backups. We retain information as long as necessary or required by law.`
  String get dataStorageDescription {
    return Intl.message(
      'Your data is stored on secure servers with backups. We retain information as long as necessary or required by law.',
      name: 'dataStorageDescription',
      desc: '',
      args: [],
    );
  }

  /// `Your Rights`
  String get yourRights {
    return Intl.message('Your Rights', name: 'yourRights', desc: '', args: []);
  }

  /// `Access & Control`
  String get accessControl {
    return Intl.message(
      'Access & Control',
      name: 'accessControl',
      desc: '',
      args: [],
    );
  }

  /// `You can access, update, delete, export your data, and opt-out of notifications.`
  String get yourRightsList {
    return Intl.message(
      'You can access, update, delete, export your data, and opt-out of notifications.',
      name: 'yourRightsList',
      desc: '',
      args: [],
    );
  }

  /// `Third-Party Sharing`
  String get thirdPartySharing {
    return Intl.message(
      'Third-Party Sharing',
      name: 'thirdPartySharing',
      desc: '',
      args: [],
    );
  }

  /// `We do NOT sell your data. Contact details are only shared when you choose to contact someone. Anonymous data may be used for analytics.`
  String get thirdPartySharingDescription {
    return Intl.message(
      'We do NOT sell your data. Contact details are only shared when you choose to contact someone. Anonymous data may be used for analytics.',
      name: 'thirdPartySharingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contact Privacy`
  String get contactPrivacy {
    return Intl.message(
      'Contact Privacy',
      name: 'contactPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `When You Contact Others`
  String get whenYouContactOthers {
    return Intl.message(
      'When You Contact Others',
      name: 'whenYouContactOthers',
      desc: '',
      args: [],
    );
  }

  /// `When you tap 'Contact Reporter', your email or phone may be shared. We recommend using in-app chat for privacy.`
  String get contactPrivacyDescription {
    return Intl.message(
      'When you tap \'Contact Reporter\', your email or phone may be shared. We recommend using in-app chat for privacy.',
      name: 'contactPrivacyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Updates to Privacy Policy`
  String get updatesToPrivacyPolicy {
    return Intl.message(
      'Updates to Privacy Policy',
      name: 'updatesToPrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Policy Changes`
  String get policyChanges {
    return Intl.message(
      'Policy Changes',
      name: 'policyChanges',
      desc: '',
      args: [],
    );
  }

  /// `We may update the privacy policy. You will be notified of major changes.`
  String get policyUpdateDescription {
    return Intl.message(
      'We may update the privacy policy. You will be notified of major changes.',
      name: 'policyUpdateDescription',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Concerns`
  String get privacyConcerns {
    return Intl.message(
      'Privacy Concerns',
      name: 'privacyConcerns',
      desc: '',
      args: [],
    );
  }

  /// `If you have questions, contact us at privacy@thameenapp.com.`
  String get privacyConcernsDescription {
    return Intl.message(
      'If you have questions, contact us at privacy@thameenapp.com.',
      name: 'privacyConcernsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Lost & Found Platform`
  String get lostAndFoundPlatform {
    return Intl.message(
      'Lost & Found Platform',
      name: 'lostAndFoundPlatform',
      desc: '',
      args: [],
    );
  }

  /// `Version 1.0.0`
  String get version {
    return Intl.message('Version 1.0.0', name: 'version', desc: '', args: []);
  }

  /// `Our Mission`
  String get ourMission {
    return Intl.message('Our Mission', name: 'ourMission', desc: '', args: []);
  }

  /// `Thameen aims to reunite people with lost belongings through community and AI technology.`
  String get ourMissionDescription {
    return Intl.message(
      'Thameen aims to reunite people with lost belongings through community and AI technology.',
      name: 'ourMissionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Key Features`
  String get keyFeatures {
    return Intl.message(
      'Key Features',
      name: 'keyFeatures',
      desc: '',
      args: [],
    );
  }

  /// `AI-powered Search`
  String get aiPoweredSearch {
    return Intl.message(
      'AI-powered Search',
      name: 'aiPoweredSearch',
      desc: '',
      args: [],
    );
  }

  /// `Upload a photo and let AI find matches.`
  String get aiPoweredSearchDescription {
    return Intl.message(
      'Upload a photo and let AI find matches.',
      name: 'aiPoweredSearchDescription',
      desc: '',
      args: [],
    );
  }

  /// `Easy Reporting`
  String get easyReporting {
    return Intl.message(
      'Easy Reporting',
      name: 'easyReporting',
      desc: '',
      args: [],
    );
  }

  /// `Quickly report lost or found items.`
  String get easyReportingDescription {
    return Intl.message(
      'Quickly report lost or found items.',
      name: 'easyReportingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Direct Chat`
  String get directChat {
    return Intl.message('Direct Chat', name: 'directChat', desc: '', args: []);
  }

  /// `Connect instantly with reporters.`
  String get directChatDescription {
    return Intl.message(
      'Connect instantly with reporters.',
      name: 'directChatDescription',
      desc: '',
      args: [],
    );
  }

  /// `Smart Notifications`
  String get smartNotifications {
    return Intl.message(
      'Smart Notifications',
      name: 'smartNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Get notified about potential matches.`
  String get smartNotificationsDescription {
    return Intl.message(
      'Get notified about potential matches.',
      name: 'smartNotificationsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Connect With Us`
  String get connectWithUs {
    return Intl.message(
      'Connect With Us',
      name: 'connectWithUs',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Licenses`
  String get licenses {
    return Intl.message('Licenses', name: 'licenses', desc: '', args: []);
  }

  /// `test`
  String get test {
    return Intl.message('test', name: 'test', desc: '', args: []);
  }

  /// `en`
  String get languageCode {
    return Intl.message('en', name: 'languageCode', desc: '', args: []);
  }

  /// `PLEASE READ THESE TERMS OF SERVICE (“TERMS” OR “AGREEMENT”) CAREFULLY BEFORE USING THE THAMEEN APPLICATION.\n\nBy downloading, accessing, or using the Thameen App (“App”), you agree to these Terms and our Privacy Policy. If you do not agree, please do not use the App.`
  String get termsIntro {
    return Intl.message(
      'PLEASE READ THESE TERMS OF SERVICE (“TERMS” OR “AGREEMENT”) CAREFULLY BEFORE USING THE THAMEEN APPLICATION.\n\nBy downloading, accessing, or using the Thameen App (“App”), you agree to these Terms and our Privacy Policy. If you do not agree, please do not use the App.',
      name: 'termsIntro',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get termsSection1Title {
    return Intl.message(
      'Introduction',
      name: 'termsSection1Title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Thameen App (“we”, “our”, or “the Company”).\n\nThameen is a digital platform designed to help users report, post, and recover lost items within the Hashemite Kingdom of Jordan.`
  String get termsSection1Body {
    return Intl.message(
      'Welcome to Thameen App (“we”, “our”, or “the Company”).\n\nThameen is a digital platform designed to help users report, post, and recover lost items within the Hashemite Kingdom of Jordan.',
      name: 'termsSection1Body',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance of Terms`
  String get termsSection2Title {
    return Intl.message(
      'Acceptance of Terms',
      name: 'termsSection2Title',
      desc: '',
      args: [],
    );
  }

  /// `By accessing or using the Services, you confirm that you have read, understood, and agree to be bound by these Terms. If you do not agree, you must stop using the application.`
  String get termsSection2Body {
    return Intl.message(
      'By accessing or using the Services, you confirm that you have read, understood, and agree to be bound by these Terms. If you do not agree, you must stop using the application.',
      name: 'termsSection2Body',
      desc: '',
      args: [],
    );
  }

  /// `Eligibility`
  String get termsSection3Title {
    return Intl.message(
      'Eligibility',
      name: 'termsSection3Title',
      desc: '',
      args: [],
    );
  }

  /// `Thameen App may be used by minors, provided they use the application in a lawful and responsible manner. Parents or guardians are encouraged to supervise usage.`
  String get termsSection3Body {
    return Intl.message(
      'Thameen App may be used by minors, provided they use the application in a lawful and responsible manner. Parents or guardians are encouraged to supervise usage.',
      name: 'termsSection3Body',
      desc: '',
      args: [],
    );
  }

  /// `Service Description`
  String get termsSection4Title {
    return Intl.message(
      'Service Description',
      name: 'termsSection4Title',
      desc: '',
      args: [],
    );
  }

  /// `Thameen App allows users to:\n\n• Search for lost items\n• Report items they have found\n• Connect with item owners or finders\n• Post descriptions and photos\n• Receive notifications related to their posts\n\nThameen acts solely as a connecting platform and does not guarantee item recovery.`
  String get termsSection4Body {
    return Intl.message(
      'Thameen App allows users to:\n\n• Search for lost items\n• Report items they have found\n• Connect with item owners or finders\n• Post descriptions and photos\n• Receive notifications related to their posts\n\nThameen acts solely as a connecting platform and does not guarantee item recovery.',
      name: 'termsSection4Body',
      desc: '',
      args: [],
    );
  }

  /// `User Responsibilities`
  String get termsSection5Title {
    return Intl.message(
      'User Responsibilities',
      name: 'termsSection5Title',
      desc: '',
      args: [],
    );
  }

  /// `Users agree to:\n\n• Provide accurate information\n• Avoid misleading or false reports\n• Respect others and the law\n• Remove content violating others’ rights\n\nUsers are fully responsible for uploaded content.`
  String get termsSection5Body {
    return Intl.message(
      'Users agree to:\n\n• Provide accurate information\n• Avoid misleading or false reports\n• Respect others and the law\n• Remove content violating others’ rights\n\nUsers are fully responsible for uploaded content.',
      name: 'termsSection5Body',
      desc: '',
      args: [],
    );
  }

  /// `Prohibited Activities`
  String get termsSection6Title {
    return Intl.message(
      'Prohibited Activities',
      name: 'termsSection6Title',
      desc: '',
      args: [],
    );
  }

  /// `You may not:\n\n• Post stolen or illegal items\n• Claim items not belonging to you\n• Upload offensive or harmful content\n• Scam or deceive users\n• Hack or disrupt the service\n\nViolations may lead to suspension or permanent removal.`
  String get termsSection6Body {
    return Intl.message(
      'You may not:\n\n• Post stolen or illegal items\n• Claim items not belonging to you\n• Upload offensive or harmful content\n• Scam or deceive users\n• Hack or disrupt the service\n\nViolations may lead to suspension or permanent removal.',
      name: 'termsSection6Body',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Data Usage`
  String get termsSection7Title {
    return Intl.message(
      'Privacy & Data Usage',
      name: 'termsSection7Title',
      desc: '',
      args: [],
    );
  }

  /// `We may collect limited information such as account details, item data, and interactions.\n\nWe do not sell or share user data and comply with Jordanian privacy laws.`
  String get termsSection7Body {
    return Intl.message(
      'We may collect limited information such as account details, item data, and interactions.\n\nWe do not sell or share user data and comply with Jordanian privacy laws.',
      name: 'termsSection7Body',
      desc: '',
      args: [],
    );
  }

  /// `Limitation of Liability`
  String get termsSection8Title {
    return Intl.message(
      'Limitation of Liability',
      name: 'termsSection8Title',
      desc: '',
      args: [],
    );
  }

  /// `Thameen App is provided “as is”. We are not liable for lost items, user interactions, fraud, or technical issues.\n\nUse of the app is at your own responsibility.`
  String get termsSection8Body {
    return Intl.message(
      'Thameen App is provided “as is”. We are not liable for lost items, user interactions, fraud, or technical issues.\n\nUse of the app is at your own responsibility.',
      name: 'termsSection8Body',
      desc: '',
      args: [],
    );
  }

  /// `Governing Law`
  String get termsSection9Title {
    return Intl.message(
      'Governing Law',
      name: 'termsSection9Title',
      desc: '',
      args: [],
    );
  }

  /// `These Terms are governed by the laws of the Hashemite Kingdom of Jordan. Any disputes shall be resolved according to Jordanian law.`
  String get termsSection9Body {
    return Intl.message(
      'These Terms are governed by the laws of the Hashemite Kingdom of Jordan. Any disputes shall be resolved according to Jordanian law.',
      name: 'termsSection9Body',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditionsTitle {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditionsTitle',
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
