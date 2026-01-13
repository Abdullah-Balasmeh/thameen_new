import 'package:cloud_firestore/cloud_firestore.dart';
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
    super.postsId,
    required super.isOnline,
    required super.lastSeen,
  });

  factory UserModel.fromFirebaseUser(
    User user,
    Map<String, dynamic> data,
  ) {
    return UserModel(
      id: user.uid,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      phoneNumber: data['phoneNumber'] as String,
      email: user.email ?? '',
      password: data['password'] as String,
      photoUrl: data['photoUrl'] as String?,
      isEmailVerified: user.emailVerified,
      createdAt: user.metadata.creationTime.toString(),
      postsId: (data['postsId'] as List<dynamic>?)?.cast<String?>(),
      isOnline: data['isOnline'] as bool,
      lastSeen: (data['lastSeen'] as Timestamp).toDate(),
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['id'] as String,
      firstName: data['firstName'] as String,
      lastName: data['lastName'] as String,
      phoneNumber: data['phoneNumber'] as String,
      email: data['email'] as String,
      password: data['password'] as String,
      photoUrl: data['photoUrl'] as String?,
      isEmailVerified: data['isEmailVerified'] as bool,
      createdAt: data['createdAt'] as String,
      postsId: (data['postsId'] as List<dynamic>?)?.cast<String?>(),
      isOnline: data['isOnline'] as bool,
      lastSeen: (data['lastSeen'] as Timestamp).toDate(),
    );
  }
}
