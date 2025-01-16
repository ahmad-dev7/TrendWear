import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double kScreenMargin = 20;

Duration kAnimationDuration = Durations.medium2;

List<BoxShadow> kBoxShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(-2, 3),
  ),
];

LinearGradient kGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Colors.orange[200]!, Colors.orange[500]!],
);
