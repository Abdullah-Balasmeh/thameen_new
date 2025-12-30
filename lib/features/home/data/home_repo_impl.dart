import 'package:thameen/features/home/domain/repositories/home_repo.dart';
import 'package:thameen/features/post%20item/data/models/post_model.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/shared/services/database_service.dart';

class HomeRepoImpl implements HomeRepo {
  final DatabaseService databaseService;

  HomeRepoImpl({required this.databaseService});

  @override
  Future<List<PostEntity>> getRecentItems() async {
    final data = await databaseService.getCollection(
      path: 'posts',
      limit: 5,
    );

    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<Map<String, dynamic>> getPostsCount() async {
    return await databaseService.getData(
      path: 'posts_count',
      documentId: 'u1wPEreIeIY0qi5KZiG9',
    );
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    final data = await databaseService.getCollection(
      path: 'posts',
    );

    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<String> getPosterNameById(String posterId) async {
    final data = await databaseService.getData(
      path: 'users',
      documentId: posterId,
    );
    final firstName = data['firstName'] as String;
    final lastName = data['lastName'] as String;
    return '$firstName $lastName';
  }
}
