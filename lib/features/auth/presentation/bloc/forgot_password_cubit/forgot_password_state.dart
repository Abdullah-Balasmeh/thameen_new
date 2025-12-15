part of 'forgot_password_cubit.dart';

sealed class ForgotPasswordState {}

class FPInitial extends ForgotPasswordState {}

class FPEmailLoading extends ForgotPasswordState {}

class FPEmailSent extends ForgotPasswordState {}

class FPEmailError extends ForgotPasswordState {
  final String message;
  FPEmailError(this.message);
}

class FPVerifyLoading extends ForgotPasswordState {}

class FPVerifySuccess extends ForgotPasswordState {}

class FPVerifyError extends ForgotPasswordState {
  final String message;
  FPVerifyError(this.message);
}

class FPResetLoading extends ForgotPasswordState {}

class FPResetSuccess extends ForgotPasswordState {}

class FPResetError extends ForgotPasswordState {
  final String message;
  FPResetError(this.message);
}
