import 'package:animate_do/animate_do.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: Transform.scale(
              child: Column(
                children: [
                  Lottie.asset('assets/animations/optimized.json'),
                  const MyToggleSwitch(),
                  HeightBox(kScreenMargin),
                  BlocBuilder<TogglerCubit, bool>(
                    builder: (context, state) {
                      if (!state) {
                        return SlideInLeft(
                          child: MyTextField(
                            prefixIcon: Icons.person_outlined,
                            onComplete: (_) {},
                          ),
                        ).pad.py16.make();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  MyTextField(
                    prefixIcon: Icons.email_outlined,
                    onComplete: (_) {},
                  ),
                  const HeightBox(15),
                  MyTextField(
                    isPasswordField: true,
                    prefixIcon: Icons.lock_outlined,
                    onComplete: (_) {},
                  ),
                  const HeightBox(15),
                  BlocBuilder<TogglerCubit, bool>(
                    builder: (context, state) {
                      if (!state) {
                        return SlideInLeft(
                          child: MyTextField(
                            isPasswordField: true,
                            showSuffix: false,
                            prefixIcon: Icons.lock,
                            onComplete: (_) {},
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
