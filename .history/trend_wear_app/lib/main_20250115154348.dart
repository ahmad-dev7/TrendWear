import 'package:flutter/cupertino.dart';
import 'package:trend_wear_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData().copyWith(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFf0f0f0),
      ),
      home: const HomeScreen(),
    );
  }
}
