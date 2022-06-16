import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/jokes/constants.dart';
import 'package:randomjokes/jokes/models/error_model.dart';
import 'package:randomjokes/jokes/models/joke_model.dart';

part 'random_jokes_event.dart';
part 'random_jokes_state.dart';

class RandomJokesBloc extends Bloc<RandomJokesEvent, RandomJokesState> {
  RandomJokesBloc()
      : super(const RandomJokesState._(null, null, RandomJokeStatus.initial)) {
    on<RandomJokesEventLoad>(_onLoad);
    on<RandomJokesEventError>(_onError);
  }

  void _onLoad(
    RandomJokesEventLoad event,
    Emitter<RandomJokesState> emit,
  ) async {
    emit(const RandomJokesState.loading(status: RandomJokeStatus.loading));
    final String url = formGetUrl(
      jokesApiEndpoint,
      event.language,
      event.type,
      event.categories,
      event.blacklistFlags,
      event.safeMode,
    );

    try {
      final Response response = await get(Uri.parse(url));
      if (jsonDecode(response.body)['error']) {
        final ErrorModel errorModel =
            ErrorModel.fromJson(jsonDecode(response.body));
        add(RandomJokesEventError(errorModel));
      } else {
        final JokeModel jokeModel =
            JokeModel.fromJson(jsonDecode(response.body));
        emit(RandomJokesState.loaded(
          jokeModel: jokeModel,
          status: RandomJokeStatus.loaded,
        ));
      }
    } on SocketException {
      emit(RandomJokesState.error(
        errorModel: ErrorModel(
          error: true,
          additionalInfo: '',
          message: 'No internet connection',
          code: 7,
          causedBy: ['No internet connection'],
          internalError: false,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
        status: RandomJokeStatus.error,
      ));
    } on HttpException {
      emit(RandomJokesState.error(
        errorModel: ErrorModel(
          error: true,
          additionalInfo: '',
          message: 'No internet connection',
          code: 7,
          causedBy: ['No internet connection'],
          internalError: false,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
        status: RandomJokeStatus.error,
      ));
    } on Exception {
      emit(RandomJokesState.error(
        errorModel: ErrorModel(
          error: true,
          additionalInfo: '',
          message: 'No internet connection',
          code: 7,
          causedBy: ['No internet connection'],
          internalError: false,
          timestamp: DateTime.now().millisecondsSinceEpoch,
        ),
        status: RandomJokeStatus.error,
      ));
    }
  }

  void _onError(
    RandomJokesEventError event,
    Emitter<RandomJokesState> emit,
  ) {
    emit(RandomJokesState.error(
      errorModel: event.errorModel,
      status: RandomJokeStatus.error,
    ));
  }

  String formGetUrl(
    String apiEndpoint,
    String language,
    List<String> type,
    List<String> categories,
    List<String> blacklistFlags,
    bool safeMode,
  ) {
    String url = apiEndpoint;

    // category
    if (categories.contains('Any')) {
      url += 'Any';
    } else {
      url += categories.join(',');
    }

    // parameters
    url += '?';

    url += 'lang=$language';

    if (blacklistFlags.isNotEmpty) {
      url += '&blacklistFlags=${blacklistFlags.join(',')}';
    }

    if (type.length == 1) {
      url += '&type=${type.first}';
    }

    if (safeMode) {
      url += '&$safeMode';
    }

    return url;
  }
}
