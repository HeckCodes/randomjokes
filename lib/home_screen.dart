import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/theme/colors.dart';
import 'package:randomjokes/theme/fonts.dart';
import 'package:randomjokes/jokes/bloc/random_jokes_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RandomColors randomColors = RandomColors();
  final RandomFonts randomFonts = RandomFonts();

  late Color randomColor;
  late TextStyle randomTextStyle;

  @override
  void initState() {
    randomColor = randomColors.randomColor;
    randomTextStyle = randomFonts.randomTextStyle;
    super.initState();
  }

  void changeColor() {
    setState(() {
      randomColor = randomColors.randomColor;
    });
  }

  void changeTextStyle() {
    setState(() {
      randomTextStyle = randomFonts.randomTextStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: randomColor,
        systemNavigationBarColor: randomColor,
      ),
      child: Scaffold(
        backgroundColor: randomColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<RandomJokesBloc>(context).add(
              RandomJokesEventLoad(
                language: 'esffg',
                type: ['single', 'twice'],
                categories: ['Any'],
                blacklistFlags: [],
                safeMode: false,
              ),
            );
          },
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
