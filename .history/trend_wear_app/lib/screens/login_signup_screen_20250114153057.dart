import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

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
          child: BlocProvider(
            create: (context) => TogglerCubit(),
            child: Column(
              children: [
                Lottie.asset('assets/animations/optimized.json'),
                const MyToggleSwitch(),
                HeightBox(kScreenMargin),
                MyTextField(
                  prefixIcon: Icons.email_outlined,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
                MyTextField(
                  prefixIcon: Icons.email_outlined,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
