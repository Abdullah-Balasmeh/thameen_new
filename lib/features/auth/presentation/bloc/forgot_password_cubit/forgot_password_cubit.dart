import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/generated/l10n.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.authRepo) : super(FPInitial());
  final AuthRepo authRepo;
  String? email;

  Future<void> checkEmailExists(String email) async {
    try {
      emit(FPEmailLoading());
      final exists = await authRepo.checkEmailExists(email);
      if (exists) {
        this.email = email;
        emit(FPEmailSent());
      } else {
        emit(FPEmailError('Email does not exist'));
      }
    } catch (e) {
      emit(FPEmailError(e.toString()));
    }
  }

  Future<void> sendOtp(String email) async {
    emit(FPEmailLoading());
    try {
      final exists = await authRepo.checkEmailExists(email);
      if (!exists) {
        emit(FPEmailError(S.current.resetPasswordErrorInvalidEmail));
        return;
      }
      final otp = authRepo.generateOtp();
      await authRepo.saveOtpToFirestore(email, otp);
      await authRepo.sendOtp(email: email, otp: otp);
      this.email = email;
      emit(FPEmailSent());
    } catch (e) {
      emit(FPEmailError(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      emit(FPVerifyLoading());
      final isVerified = await authRepo.verifyOtp(email, otp);
      if (isVerified) {
        emit(FPVerifySuccess());
      } else {
        emit(FPVerifyError('Invalid OTP'));
      }
    } catch (e) {
      emit(FPVerifyError(e.toString()));
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    try {
      emit(FPResetLoading());
      await authRepo.updatePassword(newPassword);
      emit(FPResetSuccess());
    } catch (e) {
      emit(FPResetError(e.toString()));
    }
  }
}
