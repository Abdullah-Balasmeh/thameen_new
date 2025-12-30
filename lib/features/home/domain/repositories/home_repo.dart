import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

abstract class HomeRepo {
  Future<List<PostEntity>> getRecentItems();
  Future<Map<String, dynamic>> getPostsCount();
  Future<List<PostEntity>> getAllPosts();

  Future<String> getPosterNameById(String postId);
}
