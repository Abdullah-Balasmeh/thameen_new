import 'package:thameen/features/post%20item/data/models/post_model.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/domain/repo/my_reports_repo.dart';
import 'package:thameen/shared/services/database_service.dart';

class MyReportsRepoImpl implements MyReportsRepo {
  final DatabaseService databaseService;

  MyReportsRepoImpl({required this.databaseService});
  Map<String, dynamic>? userData;
  @override
  @override
  Future<List<PostEntity>> getMyReports(String userId) async {
    final posts = await databaseService.queryCollection(
      path: 'posts',
      field: 'userId',
      isEqualTo: userId,
    );
    userData = await databaseService.getData(
      path: 'users',
      documentId: userId,
    );

    return posts.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<void> updateReportStatus(String postId, PostState newStatus) async {
    if (newStatus.name == 'deleted') {
      await deleteReport(postId);
      return;
    }
    await databaseService.updateData(
      path: 'posts',
      documentId: postId,
      data: {'postState': newStatus.name},
    );
  }

  @override
  @override
  Future<void> deleteReport(String postId) async {
    // 1️⃣ حذف التقرير
    await databaseService.deleteData(
      path: 'posts',
      documentId: postId,
    );

    // 2️⃣ حذف التقرير من المستخدم
    final postsId = userData?['postsId'] as List<dynamic>? ?? [];

    postsId.remove(postId);

    // 4️⃣ تحديث المستخدم بالقائمة الجديدة
    await databaseService.updateData(
      path: 'users',
      documentId: userData?['id'] as String,
      data: {
        'postsId': postsId,
      },
    );
  }

  @override
  Future<void> editReport(PostEntity post) async {
    await databaseService.updateData(
      path: 'posts',
      documentId: post.id,
      data: post.toMap(),
    );
  }
}
