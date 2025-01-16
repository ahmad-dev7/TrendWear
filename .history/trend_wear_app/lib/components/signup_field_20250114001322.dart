import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

class SignupField extends StatefulWidget {
  const SignupField({super.key});

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> {
  bool showWidget = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        return SlideInLeft(
          animate: !data,
          duration: const Duration(milliseconds: 500), // Adjust duration as needed
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: showWidget ? 1.0 : 0.0,
            onEnd: () {
              if (!showWidget) {
                setState(() {
                  showWidget = true;
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyTextField(
                placeholder: 'Name',
                prefixIcon: Icons.person,
                onComplete: (p0) => '',
              ),
            ),
          ),
          onFinish: (direction) {
            if (data) {
              setState(() {
                showWidget = false;
              });
            }
            debugPrint("Animation finished");
          },
        );
      },
    );
  }
}
