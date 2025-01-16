import 'package:animate_do/animate_do.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/components/signup_field.dart';
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
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => TogglerCubit(),
          child: SlideInDown(
            child: Column(
              children: [
                HeightBox(kScreenMargin),
                Lottie.asset('assets/animations/optimized.json'),
                const MyToggleSwitch(),
                HeightBox(kScreenMargin),
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Name',
                    inputType: TextInputType.name,
                    prefixIcon: Icons.person_outlined,
                    onComplete: (_) {},
                  ),
                ),
                MyTextField(
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
                MyTextField(
                  placeholder: 'Password',
                  inputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  prefixIcon: Icons.lock_outlined,
                  onComplete: (_) {},
                ),
                const HeightBox(15),
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Confirm password',
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: Icons.lock,
                    onComplete: (_) {},
                  ),
                ),
                CupertinoButton(
                  child: BlocBuilder<TogglerCubit, bool>(
                      builder: (context, data) => AnimatedSwitcher(
                            duration: kAnimationDuration * 10,
                            child: (data ? 'login' : 'Signup')
                                .text
                                .fontWeight(FontWeight.w500)
                                .letterSpacing(1.2)
                                .black
                                .makeCentered()
                                .box
                                .size(double.maxFinite, 48)
                                .gradientFromTo(from: Vx.orange200, to: Vx.orange500)
                                .roundedSM
                                .make(),
                          )),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
