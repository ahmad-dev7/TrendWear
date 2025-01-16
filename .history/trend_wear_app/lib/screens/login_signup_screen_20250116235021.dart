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
import 'package:trend_wear_app/screens/navigation_screen.dart';
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
    void snackAlert(String info) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: info.text.white.bold.size(15).make(),
          backgroundColor: kSolidAccentColor,
          elevation: 12,
          action: SnackBarAction(
            label: 'Close',
            onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
            backgroundColor: Colors.white,
            textColor: kSolidAccentColor,
          ),
        ),
      );
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(kScreenMargin),
        child: SingleChildScrollView(
          child: FadeInDown(
            from: 200,
            child: Column(
              children: [
                HeightBox(kScreenMargin),
                //* Animation
                Lottie.asset('assets/animations/shopping_trolly.json'),
                //* Toggle Switch
                const MyToggleSwitch(),
                HeightBox(kScreenMargin),
                //* Name field
                SignupField(
                  textField: MyTextField(
                    placeholder: 'Name',
                    inputType: TextInputType.name,
                    prefixIcon: CupertinoIcons.person,
                    onComplete: (value) => _name = value,
                  ),
                ),
                //* Email field
                MyTextField(
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  prefixIcon: CupertinoIcons.mail,
                  onComplete: (value) => _email = value,
                ),
                const HeightBox(15),
                //* Password field
                BlocBuilder<TogglerCubit, bool>(
                  builder: (context, state) {
                    return MyTextField(
                      placeholder: 'Password',
                      inputAction: state ? TextInputAction.done : TextInputAction.next,
                      inputType: TextInputType.visiblePassword,
                      isPasswordField: true,
                      prefixIcon: CupertinoIcons.lock,
                      onComplete: (value) => _password = value,
                    );
                  },
                ),
                const HeightBox(15),
                //* Confirm Password field
                SignupField(
                  textField: MyTextField(
                    key: const Key("new field"),
                    placeholder: 'Confirm password',
                    inputAction: TextInputAction.done,
                    isPasswordField: true,
                    showSuffix: false,
                    inputType: TextInputType.visiblePassword,
                    prefixIcon: CupertinoIcons.lock_fill,
                    onComplete: (value) => _confirmPassword = value,
                  ),
                ),
                //* Action button
                CupertinoButton(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: MultiBlocListener(
                    listeners: [
                      BlocListener<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const NavigationScreen()),
                            );
                          }
                          if (state is LoginInvalid) snackAlert(state.message);
                          if (state is LoginFailure) snackAlert(state.errorMessage);
                        },
                      ),
                      BlocListener<SignupCubit, SignupState>(
                        listener: (context, state) {
                          //? After success of signup, login method would be called with same credentials to get the jwt token and store it
                          if (state is SignupSuccess) context.read<LoginCubit>().login(_email!, _password!);
                          if (state is SignupLoading) context.read<LoginCubit>().updateState(LoginLoading());
                        },
                      ),
                    ],
                    child: BlocBuilder<TogglerCubit, bool>(
                      builder: (context, isLoginSection) {
                        return BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, loginState) {
                            return BlocBuilder<SignupCubit, SignupState>(
                              builder: (context, signupState) {
                                bool isLoading = loginState is LoginLoading;
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
                  ),
                  onPressed: () {
                    var togglerCubit = context.read<TogglerCubit>();
                    //! For login
                    if (togglerCubit.state) {
                      if (_email != null && _password != null) {
                        context.read<LoginCubit>().login(_email!, _password!);
                      } else {
                        snackAlert('Please enter correct details');
                      }
                    }
                    //! For signup
                    else {
                      if (_email != null && _password != null) {
                        if (_password == _confirmPassword) {
                          context.read<SignupCubit>().signup(_name!, _email!, _password!);
                        } else {
                          snackAlert('Password & Confirm password should be same');
                        }
                      } else {
                        snackAlert('Please enter correct details');
                      }
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
