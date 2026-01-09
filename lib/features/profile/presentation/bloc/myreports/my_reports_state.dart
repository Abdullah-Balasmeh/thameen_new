part of 'my_reports_cubit.dart';

abstract class MyReportsState {}

class MyReportsInitial extends MyReportsState {}

class MyReportsLoading extends MyReportsState {}

class MyReportsSuccess extends MyReportsState {
  final List<PostEntity> posts;

  MyReportsSuccess(this.posts);
}

class MyReportsFailure extends MyReportsState {
  final String errMessage;

  MyReportsFailure(this.errMessage);
}

class UpdateReportLoading extends MyReportsState {}

class UpdateReportSuccess extends MyReportsState {}

class UpdateReportFailure extends MyReportsState {
  final String errMessage;

  UpdateReportFailure(this.errMessage);
}
