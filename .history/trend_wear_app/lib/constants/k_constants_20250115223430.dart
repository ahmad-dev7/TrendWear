import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trend_wear_app/model/bottom_navigation_model.dart';

double kScreenMargin = 20;

Duration kAnimationDuration = Durations.medium2;

Color kBackgroundColor = const Color(0x0ffddddf);
Color kLightAccentColor = const Color(0xffeb8965);
Color kSolidAccentColor = const Color(0xFFdd6151);

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

Map<int, BottomNavigationIconAndLabel> kBottomNavigationData = {
  0: const BottomNavigationIconAndLabel(
    iconData: CupertinoIcons.heart,
    label: 'Favorite',
  ),
  1: const BottomNavigationIconAndLabel(
    iconData: CupertinoIcons.home,
    label: 'Home',
  ),
  2: const BottomNavigationIconAndLabel(
    iconData: CupertinoIcons.cart,
    label: 'Cart',
  ),
};
