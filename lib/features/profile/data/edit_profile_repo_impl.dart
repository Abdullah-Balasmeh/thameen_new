import 'package:dartz/dartz.dart';
import 'package:thameen/core/errors/failure.dart';
import 'package:thameen/features/auth/data/models/user_model.dart';
import 'package:thameen/features/auth/domain/entities/user_entity.dart';
import 'package:thameen/features/profile/domain/edit_profile_repo.dart';
import 'package:thameen/shared/services/database_service.dart';

class EditProfileRepoImpl implements EditProfileRepo {
  final DatabaseService databaseService;
  EditProfileRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, UserEntity>> getUser(String userId) async {
    try {
      final data = await databaseService.getData(
        path: 'users',
        documentId: userId,
      );
      return Right(UserModel.fromMap(data));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<void> updateProfile(UserEntity user) async {
    await databaseService.updateData(
      path: 'users',
      documentId: user.id,
      data: user.toMap(),
    );
  }

  @override
  Future<void> updateEmail(String userId, String newEmail) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<void> updateProfilePhoto(String userId, String photoUrl) {
    // TODO: implement updateProfilePhoto
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserChats(String userId) {
    // TODO: implement updateUserChats
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserPosts(String userId) {
    // TODO: implement updateUserPosts
    throw UnimplementedError();
  }
}
