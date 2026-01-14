import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:thameen/core/errors/failure.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';

abstract class EditProfileRepo {
  Future<Either<Failure, UserEntity>> getUser(String userId);
  Future<void> updateProfile(UserEntity user);
  Future<Either<Failure, String>> updateProfilePhoto(String userId, File photo);
  Future<void> updateEmail(String userId, String newEmail);
  Future<void> updateUserPosts(
    String userId,
  );
  Future<void> updateUserChats(
    String userId,
  );
}
