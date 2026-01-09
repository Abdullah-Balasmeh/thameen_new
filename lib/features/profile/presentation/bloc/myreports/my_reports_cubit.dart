import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thameen/features/post%20item/domain/entities/post_entity.dart';
import 'package:thameen/features/profile/domain/repo/my_reports_repo.dart';
import 'package:thameen/shared/services/firebase_storage.dart';
import 'package:thameen/shared/services/shared_preferences_singleton.dart';

part 'my_reports_state.dart';

class MyReportsCubit extends Cubit<MyReportsState> {
  MyReportsCubit(this.myReportsRepo, {required this.storageService})
    : super(MyReportsInitial());
  final MyReportsRepo myReportsRepo;
  final FirebaseStorageService storageService;
  List<PostEntity> posts = [];
  Future<void> getMyReports() async {
    log('getMyReports from edit post');
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
    emit(UpdateReportLoading());
    try {
      await myReportsRepo.editReport(post);
      emit(UpdateReportSuccess());

      await getMyReports();
    } catch (e) {
      emit(UpdateReportFailure(e.toString()));
    }
  }

  Future<List<String>> uploadImage(String postId, List<File> images) async {
    return await storageService.uploadPostImages(
      postId: postId,
      images: images,
    );
  }
}
