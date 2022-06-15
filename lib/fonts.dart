import 'dart:math';

import 'package:flutter/material.dart';

class JokeFonts {
  final List<TextStyle> textStyleList = [
    const TextStyle(fontFamily: 'RubikBubbles'),
    const TextStyle(fontFamily: 'RubikGlitch'),
    const TextStyle(fontFamily: 'RubikMicrobe'),
    const TextStyle(fontFamily: 'RubikMoonrocks'),
    const TextStyle(fontFamily: 'RubikWetPaint'),
  ];

  TextStyle get randomTextStyle =>
      textStyleList[Random().nextInt(textStyleList.length)];
}
