import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/optimized.json', height: 200),
          const SizedBox(height: 15),
          AnimatedContainer(
            duration: kAnimationDuration,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: kBoxShadow,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(kScreenMargin),
              child: Column(
                children: [
                  const MyToggleSwitch(),
                  SizedBox(height: kScreenMargin),
                  MyTextField(
                    placeholder: 'Email',
                    prefixIcon: Icons.email,
                    onComplete: (_) => debugPrint(_),
                  ),
                  const SizedBox(height: 15),
                  MyTextField(
                    placeholder: 'Password',
                    prefixIcon: Icons.lock,
                    onComplete: (_) => debugPrint(_),
                    isPasswordField: true,
                  ),
                  const SizedBox(height: 15),
                  AnimatedContainer(
                    duration: kAnimationDuration,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
