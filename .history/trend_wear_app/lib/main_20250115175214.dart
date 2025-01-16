import 'package:flutter/material.dart';
import 'package:trend_wear_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: const Color(0xFFf0f0f0)),
      home: const HomeScreen(),
    );
  }
}
