part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}

class HomeRecentPostsSuccess extends HomeState {
  final List<PostEntity> posts;

  HomeRecentPostsSuccess(this.posts);
}

class HomeSearchSuccess extends HomeState {
  final List<PostEntity> posts;

  HomeSearchSuccess(this.posts);
}
