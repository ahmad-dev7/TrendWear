import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onSignup: (_) => null,
      onLogin: (_) async {
        debugPrint(_.name);
        debugPrint(_.password);
        return await Future.delayed(Durations.extralong1);
      },
      onRecoverPassword: (_) {
        return null;
      },
    );
  }
}
