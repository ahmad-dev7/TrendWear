import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';

GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width + 40,
      child: FlutterLogin(
        hideForgotPasswordButton: true,
        headerWidget: const SizedBox(height: 300),
        theme: LoginTheme(
          primaryColor: Theme.of(context).scaffoldBackgroundColor,
          buttonStyle: const TextStyle(color: Colors.black),
          switchAuthTextColor: Colors.black54,
          headerMargin: 0,
          cardTopPosition: 100,
          cardTheme: CardTheme(
            margin: const EdgeInsets.all(0),
            color: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 4,
          ),
        ),
        onSignup: (_) {
          return null;
        },
        onLogin: (_) {
          return null;
        },
        onRecoverPassword: (_) {
          return null;
        },
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 300),
              child: Lottie.asset('assets/animations/optimized.json', height: MediaQuery.of(context).size.height / 3),
            ),
          ),
        ],
      ),
    );
  }
}
