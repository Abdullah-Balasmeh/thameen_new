import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(this.authRepo) : super(EmailVerificationInitial());
  final AuthRepo authRepo;

  Future<void> sendOtp(String email) async {
    try {
      final otp = authRepo.generateOtp();
      await authRepo.saveOtpToFirestore(email, otp);
      await authRepo.sendOtp(email: email, otp: otp);
    } catch (e) {
      emit(EmailVerificationFailure(errMessage: e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      emit(EmailVerificationLoading());
      final isVerified = await authRepo.verifyOtp(email, otp);
      if (isVerified) {
        await verifyEmail(email);
        emit(EmailVerificationSuccess());
      } else {
        emit(EmailVerificationFailure(errMessage: 'Invalid OTP'));
      }
    } catch (e) {
      emit(EmailVerificationFailure(errMessage: e.toString()));
    }
  }

  Future<void> resendOtp(String email) async {
    await sendOtp(email);
  }

  Future<void> verifyEmail(String email) async {
    await authRepo.updateEmailVerificationStatus(email, true);
  }
}
