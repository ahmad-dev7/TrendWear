import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kScreenMargin),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset('assets/animations/optimized.json'),
            ],
          ),
        ),
      ),
    );
  }
}
