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
  bool hideChild = false; // Initially, the child is visible.

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        return SlideInLeft(
          animate: !data, // Animation triggered by Bloc state.
          onFinish: (_) {
            debugPrint('I got triggered');
            // Hide the child only after the animation finishes.
            if (data) {
              setState(() {
                hideChild = true;
              });
            }
          },
          child: hideChild
              ? const SizedBox() // Empty SizedBox when `hideChild` is true.
              : Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: MyTextField(
                    prefixIcon: Icons.person,
                    onComplete: (p0) => '',
                  ),
                ),
        );
      },
    );
  }
}
