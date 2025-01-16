import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/flip_content.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:trend_wear_app/theme/colors.dart';

GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      theme: LoginTheme(
        primaryColor: Theme.of(context).scaffoldBackgroundColor,
        buttonStyle: const TextStyle(color: Colors.black),
        switchAuthTextColor: Colors.black54,
        cardTheme: CardTheme(
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
    );
  }
}
