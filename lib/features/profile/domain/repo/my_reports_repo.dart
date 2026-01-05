import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';

abstract class MyReportsRepo {
  Future<List<PostEntity>> getMyReports(String userId);
  Future<void> updateReportStatus(String postId, PostState newStatus);
  Future<void> deleteReport(String postId);
  Future<void> editReport(PostEntity post);
}
