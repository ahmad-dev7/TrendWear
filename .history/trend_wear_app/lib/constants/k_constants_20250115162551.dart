import 'package:flutter/material.dart';

double kScreenMargin = 20;

Duration kAnimationDuration = Durations.medium2;

Color kBackgroundColor = const Color(0x0ffddddf);
Color kLightAccentColor = const Color(0xffffbf82);
Color kSolidAccentColor = const Color(0xFFd9584c);

List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(-2, 3),
  ),
];

LinearGradient kGradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffffbf82),
    Color(0xfff0976d),
    Color(0xffeb8965),
    Color(0xFFec8c67),
    Color(0xFFdd6151),
  ],
);
