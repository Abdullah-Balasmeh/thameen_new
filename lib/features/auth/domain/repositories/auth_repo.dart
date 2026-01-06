import 'package:dartz/dartz.dart';
import 'package:thameen/core/errors/failure.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  String? get currentUserId;
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    UserEntity user,
    String password,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<void> addUserData({required UserEntity user});

  Future<bool> checkEmailExists(String email);
  String generateOtp();
  Future<void> saveOtpToFirestore(String email, String otp);
  Future<void> sendOtp({
    required String email,
    required String otp,
  });
  Future<bool> verifyOtp(String email, String otp);
  Future<void> updatePassword(String newPassword);
  Future<void> updateEmailVerificationStatus(String email, bool status);
  Future<bool> checkEmailVerificationStatus(String email);
  Future<Either<Failure, UserEntity>> tempLogin(
    String email,
  );
}
