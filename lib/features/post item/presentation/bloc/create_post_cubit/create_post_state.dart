part of 'create_post_cubit.dart';

abstract class CreatePostState {}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostSuccess extends CreatePostState {}

class CreatePostFailure extends CreatePostState {
  final String errMessage;

  CreatePostFailure({required this.errMessage});
}
