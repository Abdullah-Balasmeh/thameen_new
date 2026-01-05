import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/post%20item/domain/repositories/post_repository.dart';
import 'package:thameen/shared/services/database_service.dart';

class PostRepositoryImpl implements PostRepository {
  final DatabaseService databaseService;
  PostRepositoryImpl({
    required this.databaseService,
  });
  @override
  Future<void> createPost(PostEntity post) async {
    await databaseService.addData(
      path: 'posts',
      data: post.toMap(),
      documentId: post.id,
    );
    var postCount = await databaseService.getData(
      path: 'posts_count',
      documentId: 'u1wPEreIeIY0qi5KZiG9',
    );
    await databaseService.updateData(
      path: 'posts_count',
      documentId: 'u1wPEreIeIY0qi5KZiG9',
      data: post.postType == PostType.lost
          ? {'lost': postCount['lost'] + 1}
          : {'found': postCount['found'] + 1},
    );
  }

  @override
  Future<void> addPostIdToUser(PostEntity post) async {
    final userData = await databaseService.getData(
      path: 'users',
      documentId: post.userId,
    );
    var postsId = userData['postsId'] as List<dynamic>?;
    postsId ??= [];
    postsId.add(post.id);
    await databaseService.updateData(
      path: 'users',
      documentId: post.userId,
      data: {
        'postsId': postsId,
      },
    );
  }
}
