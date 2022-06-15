import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/home_screen.dart';
import 'package:randomjokes/jokes/bloc/random_jokes_bloc.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Jokes',
      home: BlocProvider(
        create: (context) => RandomJokesBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
