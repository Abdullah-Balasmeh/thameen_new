import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/core/constants/shared_pref_constants.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo;
  String email = '';
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    bool isRememberMe,
  ) async {
    emit(SignInLoading());
    this.email = email;
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailure(errMessage: failure.errorMessage)),
      (user) {
        if (isRememberMe) {
          SharedPreferencesSingleton.setBool(kisRememberMe, true);
          SharedPreferencesSingleton.setString('email', email);
          SharedPreferencesSingleton.setString('password', password);
        }
        emit(SignInSuccess(user: user));
      },
    );
  }

  Future<bool> checkEmailVerificationStatus() async {
    log('checkEmailVerificationStatus: $email');
    return await authRepo.checkEmailVerificationStatus(email);
  }

  Future<void> sendOtp(String email) async {
    try {
      final otp = authRepo.generateOtp();
      await authRepo.saveOtpToFirestore(email, otp);
      await authRepo.sendOtp(email: email, otp: otp);
    } catch (e) {
      log('Error: ${e.toString()}');
      emit(SignInFailure(errMessage: e.toString()));
    }
  }
}
