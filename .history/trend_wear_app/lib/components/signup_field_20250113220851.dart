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
  bool hideChild = false; // Controls visibility of the child widget.

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        if (data && !hideChild) {
          // When `data` is true and child is visible, schedule hiding it.
          Future.microtask(() {
            setState(() {
              hideChild = true;
            });
          });
        } else if (!data && hideChild) {
          // When `data` is false and child is hidden, make it visible.
          Future.microtask(() {
            setState(() {
              hideChild = false;
            });
          });
        }

        return hideChild
            ? const SizedBox() // Display SizedBox when hidden.
            : SlideInLeft(
                animate: !data, // Always animate when showing.
                child: Padding(
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
