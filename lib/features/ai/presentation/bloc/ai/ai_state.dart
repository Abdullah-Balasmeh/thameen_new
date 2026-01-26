part of 'ai_cubit.dart';

abstract class AiSearchState {}

class AiSearchInitial extends AiSearchState {}

class AiSearchLoading extends AiSearchState {}

class AiSearchSuccess extends AiSearchState {
  final List<AiMatchModel> results;

  AiSearchSuccess(this.results);
}

class AiSearchFailure extends AiSearchState {
  final String message;

  AiSearchFailure(this.message);
}
