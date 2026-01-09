part of 'create_post_cubit.dart';

abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostFailure extends CreatePostState {
  final String errMessage;

  CreatePostFailure({required this.errMessage});
}

class EditPostInitial extends CreatePostState {}

class EditPostLoading extends CreatePostState {}

class EditPostSuccess extends CreatePostState {}

class EditPostFailure extends CreatePostState {
  final String errMessage;

  EditPostFailure({required this.errMessage});
}
