import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/flip_content.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

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
      padding: EdgeInsets.symmetric(horizontal: kScreenMargin),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Lottie.asset('assets/animations/optimized.json', height: MediaQuery.of(context).size.height / 3),
            const SizedBox(height: 15),
            FlutterLogin(
              onLogin: (_) {
                return null;
              },
              onRecoverPassword: (_) {
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
