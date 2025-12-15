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
  }
}
