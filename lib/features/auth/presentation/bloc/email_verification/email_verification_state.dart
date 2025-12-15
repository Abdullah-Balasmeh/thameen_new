part of 'email_verification_cubit.dart';

sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationSuccess extends EmailVerificationState {}

final class EmailVerificationFailure extends EmailVerificationState {
  final String errMessage;

  EmailVerificationFailure({required this.errMessage});
}
