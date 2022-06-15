import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:randomjokes/colors.dart';
import 'package:randomjokes/fonts.dart';

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
      ),
    );
  }
}
