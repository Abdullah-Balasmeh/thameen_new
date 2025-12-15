import 'package:firebase_auth/firebase_auth.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.email,
    required super.password,
    super.photoUrl,
    required super.isEmailVerified,
    required super.createdAt,
  });

  factory UserModel.fromFirebaseUser(
    User user,
    String? password,
  ) {
    return UserModel(
      id: user.uid,
      firstName: user.displayName ?? '',
      lastName: user.displayName ?? '',
      phoneNumber: user.phoneNumber ?? '',
      email: user.email ?? '',
      password: password ?? '',
      photoUrl: user.photoURL ?? '',
      isEmailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime.toString(),
    );
  }
}
