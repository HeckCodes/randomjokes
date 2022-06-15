part of 'random_jokes_bloc.dart';

enum RandomJokeStatus {
  initial,
  loaded,
  error,
}

class RandomJokesState extends Equatable {
  final RandomJokeStatus status;
  final JokeModel? jokeModel;
  final ErrorModel? errorModel;

  const RandomJokesState._(this.jokeModel, this.errorModel, this.status);

  const RandomJokesState.loaded({
    required JokeModel jokeModel,
    required RandomJokeStatus status,
  }) : this._(jokeModel, null, status);

  const RandomJokesState.error({
    required ErrorModel? errorModel,
    required RandomJokeStatus status,
  }) : this._(null, errorModel, status);

  @override
  List<Object> get props => [status];
}
