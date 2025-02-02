import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

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
          Lottie.asset('assets/animations/optimized.json'),
          const SizedBox(height: 15),
          BlocProvider(
            create: (context) => TogglerCubit(true),
            child: AnimatedContainer(
              duration: kAnimationDuration,
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: kBoxShadow,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kScreenMargin,
                  vertical: kScreenMargin * 2,
                ),
                child: Column(
                  children: [
                    MyTextField(
                      prefixIcon: Icons.email,
                      onComplete: (_) => debugPrint(_),
                    ),
                    SizedBox(height: kScreenMargin),
                    BlocBuilder<TogglerCubit, bool>(
                      bloc: TogglerCubit(true),
                      builder: (context, state) {
                        return MyTextField(
                          prefixIcon: Icons.lock,
                          onComplete: (_) => debugPrint(_),
                          isPasswordField: !state,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
