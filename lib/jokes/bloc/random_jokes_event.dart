part of 'random_jokes_bloc.dart';

abstract class RandomJokesEvent extends Equatable {
  const RandomJokesEvent();

  @override
  List<Object> get props => [];
}

class RandomJokesEventLoad extends RandomJokesEvent {
  final String language;
  final List<String> type;
  final List<String> categories;
  final List<String> blacklistFlags;
  final bool safeMode;

  const RandomJokesEventLoad({
    required this.language,
    required this.type,
    required this.categories,
    required this.blacklistFlags,
    required this.safeMode,
  });

  @override
  List<Object> get props =>
      [language, type, categories, blacklistFlags, safeMode];
}

class RandomJokesEventError extends RandomJokesEvent {
  final ErrorModel errorModel;

  const RandomJokesEventError(this.errorModel);

  @override
  List<Object> get props => [errorModel];
}
