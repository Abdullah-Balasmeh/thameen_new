import 'dart:developer';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thameen/core/errors/exceptions.dart';
import 'package:thameen/core/errors/failure.dart';
import 'package:thameen/core/utils/helper/password_encryptor.dart';
import 'package:thameen/features/auth/data/models/user_model.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/auth/domain/repositories/auth_repo.dart';
import 'package:thameen/shared/services/brevo_service.dart';
import 'package:thameen/shared/services/database_service.dart';
import 'package:thameen/shared/services/firebase_auth_service.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService authService;
  final DatabaseService databaseService;
  final BrevoService brevoService = BrevoService();

  late UserCredential userCredential;
  static const String usersPath = 'users';

  AuthRepoImpl({
    required this.authService,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    UserEntity userData,
    String password,
  ) async {
    User? user;
    final hash = PasswordEncryptor.encryptPassword(password);
    try {
      user = await authService.createUserWithEmailAndPassword(
        email: userData.email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        id: user.uid,
        firstName: userData.firstName,
        lastName: userData.lastName,
        phoneNumber: userData.phoneNumber,
        email: userData.email,
        password: hash,
        isEmailVerified: userData.isEmailVerified,
        createdAt: userData.createdAt,
      );
      await addUserData(user: userEntity);
      log('userEntity: $userEntity');
      return Right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await deleteUser(user);
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        await deleteUser(user);
      }
      return const Left(ServerFailure('حدث خطأ غير متوقع. حاول مرة أخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final data = await databaseService.getData(
        path: usersPath,
        documentId: user.uid,
      );

      return Right(
        UserModel.fromFirebaseUser(user, data),
      );
    } catch (_) {
      return const Left(ServerFailure('Invalid credentials'));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: usersPath,
      data: user.toMap(),
      documentId: user.id,
    );
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await authService.deleteAccount();
    }
  }

  @override
  Future<bool> checkEmailExists(String email) async {
    final users = await databaseService.streamCollection(path: usersPath).first;

    return users.any((u) => u['email'] == email);
  }

  /// Generate 6-digit OTP
  @override
  String generateOtp() {
    final rand = math.Random();
    return List.generate(6, (_) => rand.nextInt(10)).join();
  }

  @override
  Future<void> saveOtpToFirestore(String email, String otp) async {
    await databaseService.setData(
      path: 'otp_codes',
      data: {
        'otp': otp,
        'createdAt': DateTime.now(),
      },
      documentId: email,
    );
  }

  @override
  Future<void> sendOtp({
    required String email,
    required String otp,
  }) async {
    try {
      await brevoService.sendEmail(
        toEmail: email,
        subject: 'Your OTP Code',
        textContent: 'Your verification code is: $otp\nValid for one minute.',
      );
      Future.delayed(
        const Duration(minutes: 3),
        () => deleteOTP(email),
      );
    } catch (e) {
      log('Error: ${e.toString()}');
      throw Exception('Failed to send OTP');
    }
  }

  @override
  /// Check OTP
  Future<bool> verifyOtp(String email, String otp) async {
    try {
      final data = await databaseService.getData(
        path: 'otp_codes',
        documentId: email,
      );
      final storedOtp = data['otp'] as String;
      final createdAt = (data['createdAt'] as Timestamp).toDate();

      final now = DateTime.now();
      if (now.difference(createdAt).inMinutes > 3) {
        return false;
      }

      if (storedOtp != otp) {
        return false;
      }
      deleteOTP(email);

      return true;
    } catch (e) {
      log('verifyOtp error: $e');
      return false;
    }
  }

  Future<void> deleteOTP(String email) async {
    await databaseService.deleteData(
      path: 'otp_codes',
      documentId: email,
    );
  }

  @override
  Future<void> updateEmailVerificationStatus(String email, bool status) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    log('updateEmailVerificationStatus: $uid, $status');

    await databaseService.updateData(
      path: usersPath,
      documentId: uid,
      data: {'isEmailVerified': status},
    );
  }

  @override
  Future<Either<Failure, UserEntity>> tempLogin(String email) async {
    try {
      final users = await databaseService
          .streamCollection(path: usersPath)
          .first;

      final userMap = users.firstWhere(
        (u) => u['email'] == email,
        orElse: () => {},
      );

      if (userMap.isEmpty) {
        return const Left(ServerFailure('User not found'));
      }

      final hashedPassword = userMap['password'] as String;

      final tempPassword = PasswordEncryptor.decryptPassword(hashedPassword);
      final user = await authService.signInWithEmailAndPassword(
        email: email,
        password: tempPassword,
      );

      return Right(
        UserModel(
          id: user.uid,
          email: userMap['email'] as String,
          firstName: userMap['firstName'] as String,
          lastName: userMap['lastName'] as String,
          phoneNumber: userMap['phoneNumber'] as String,
          isEmailVerified: userMap['isEmailVerified'] as bool,
          createdAt: userMap['createdAt'] as String,
          password: tempPassword,
        ),
      );
    } catch (e) {
      log('TempLogin error: $e');
      return const Left(ServerFailure('Temp login error'));
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    User? user = authService.currentUser;
    if (user == null) throw Exception('User not logged in');
    await user.updatePassword(newPassword);
    final hashed = PasswordEncryptor.encryptPassword(newPassword);

    await databaseService.updateData(
      path: usersPath,
      documentId: user.uid,
      data: {'password': hashed},
    );
  }

  @override
  Future<bool> checkEmailVerificationStatus(String email) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    try {
      final data = await databaseService.getData(
        path: usersPath,
        documentId: uid,
      );
      return data['isEmailVerified'] as bool;
    } catch (e) {
      log('checkEmailVerificationStatus error: $e');
      return false;
    }
  }
}
