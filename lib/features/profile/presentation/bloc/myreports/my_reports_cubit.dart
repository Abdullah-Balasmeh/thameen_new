import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/domain/repo/my_reports_repo.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

part 'my_reports_state.dart';

class MyReportsCubit extends Cubit<MyReportsState> {
  MyReportsCubit(this.myReportsRepo) : super(MyReportsInitial());
  final MyReportsRepo myReportsRepo;
  List<PostEntity> posts = [];
  Future<void> getMyReports() async {
    String userId = SharedPreferencesSingleton.getString('user');
    emit(MyReportsLoading());
    try {
      final posts = await myReportsRepo.getMyReports(userId);
      emit(MyReportsSuccess(posts));
    } catch (e) {
      log('Error: ${e.toString()}');
      emit(MyReportsFailure(e.toString()));
    }
  }

  Future<void> updateReportStatus(String postId, PostState newStatus) async {
    await myReportsRepo.updateReportStatus(postId, newStatus);
    getMyReports();
  }

  Future<void> deleteReport(String postId) async {
    await myReportsRepo.deleteReport(postId);
    getMyReports();
  }

  Future<void> editReport(PostEntity post) async {
    await myReportsRepo.editReport(post);
    posts.removeWhere((element) => element.id == post.id);
    getMyReports();
  }
}
