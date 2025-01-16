import 'package:animate_do/animate_do.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/components/signup_field.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/login_cubit.dart';
import 'package:trend_wear_app/cubit/signup_cubit.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

GlobalKey<FlipCardState> flipCardKey = GlobalKey<FlipCardState>();

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  String? _email;
  String? _password;
  String? _name;
  String? _confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kScreenMargin),
        child: SingleChildScrollView(
          child: FadeInDown(
            from: 200,
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
                    prefixIcon: CupertinoIcons.person,
                    onComplete: (value) => _name = value,
                  ),
                ),
                MyTextField(
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: CupertinoIcons.mail,
                  onComplete: (value) => _email = value,
                ),
                const HeightBox(15),
                MyTextField(
                  placeholder: 'Password',
                  inputType: TextInputType.visiblePassword,
                  isPasswordField: true,
                  prefixIcon: CupertinoIcons.lock,
                  onComplete: (value) => _password = value,
                ),
                const HeightBox(15),
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Confirm password',
                    isPasswordField: true,
                    showSuffix: false,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: CupertinoIcons.lock_fill,
                    onComplete: (value) => _confirmPassword = value,
                  ),
                ),
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: BlocBuilder<TogglerCubit, bool>(
                    builder: (context, isLoginSection) {
                      return BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, loginState) {
                          return BlocBuilder<SignupCubit, SignupState>(
                            builder: (context, signupState) {
                              bool isLoading = (loginState is LoginLoading || signupState is SignupLoading);
                              var label = isLoginSection ? 'login' : 'Signup';
                              return AnimatedSwitcher(
                                duration: kAnimationDuration * 10,
                                child: VxBox(
                                        child: isLoading
                                            ? const CupertinoActivityIndicator(color: Colors.white, radius: 13)
                                            : label.text.medium.white.makeCentered())
                                    .size(double.maxFinite, 50)
                                    .roundedSM
                                    .withGradient(kGradient)
                                    .make(),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                  onPressed: () {
                    var togglerCubit = context.read<TogglerCubit>();
                    if (togglerCubit.state) {
                      context.read<LoginCubit>().login(username, password);
                    } else {
                      context.read<SignupCubit>().signup(username, password);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
