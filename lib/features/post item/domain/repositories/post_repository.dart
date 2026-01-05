import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<void> createPost(PostEntity post);
  Future<void> addPostIdToUser(PostEntity post);
}
