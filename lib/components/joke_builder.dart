import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/jokes/bloc/random_jokes_bloc.dart';

class JokeBuilder extends StatelessWidget {
  final TextStyle randomTextStyle;
  const JokeBuilder({Key? key, required this.randomTextStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomJokesBloc, RandomJokesState>(
      builder: (context, state) {
        if (state.status == RandomJokeStatus.initial) {
          return Padding(
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Random Jokes',
                  textAlign: TextAlign.center,
                  style: randomTextStyle.copyWith(
                    fontSize: 44,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        } else if (state.status == RandomJokeStatus.error) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Error:',
                    textAlign: TextAlign.center,
                    style: randomTextStyle.copyWith(
                      fontSize: 44,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    state.errorModel!.message,
                    textAlign: TextAlign.center,
                    style: randomTextStyle.copyWith(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state.status == RandomJokeStatus.loading) {
          return Padding(
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Loading you haha joke...',
                  textAlign: TextAlign.center,
                  style: randomTextStyle.copyWith(
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 56, left: 16, right: 16),
            child: Column(
              children: state.jokeModel!.type == 'single'
                  ? [
                      Text(
                        state.jokeModel!.joke!,
                        textAlign: TextAlign.center,
                        style: randomTextStyle.copyWith(
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                    ]
                  : [
                      Text(
                        state.jokeModel!.setup!,
                        textAlign: TextAlign.center,
                        style: randomTextStyle.copyWith(
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        state.jokeModel!.delivery!,
                        textAlign: TextAlign.center,
                        style: randomTextStyle.copyWith(
                          fontSize: 36,
                          color: Colors.white,
                        ),
                      ),
                    ],
            ),
          );
        }
      },
    );
  }
}
