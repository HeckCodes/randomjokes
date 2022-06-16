import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/components/configuration_widget.dart';
import 'package:randomjokes/components/joke_builder.dart';
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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: randomColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                JokeBuilder(randomTextStyle: randomTextStyle),
                const SizedBox(height: 100),
                ConfigurationWidget(
                  color: randomColor,
                  textStyle: randomTextStyle,
                  onColorChange: changeColor,
                  onTextStyleChange: changeTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
