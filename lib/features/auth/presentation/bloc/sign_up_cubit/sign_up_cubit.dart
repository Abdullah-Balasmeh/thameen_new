import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWWithEmailAndPassword(
    UserEntity user,
    String password,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
      UserEntity(
        id: user.id,
        firstName: user.firstName,
        lastName: user.lastName,
        phoneNumber: user.phoneNumber,
        email: user.email,
        password: password,
        isEmailVerified: user.isEmailVerified,
        photoUrl: user.photoUrl,
        createdAt: user.createdAt,
        postsId: user.postsId,
      ),
      password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errMessage: failure.errorMessage)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }

  Future<void> sendOtp(String email) async {
    try {
      final otp = authRepo.generateOtp();
      log('otp: $otp');
      await authRepo.saveOtpToFirestore(email, otp);
      log('otp saved to firestore');
      await authRepo.sendOtp(email: email, otp: otp);
      log('otp sent to email');
    } catch (e) {
      log('Error: ${e.toString()}');
    }
  }
}
