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
  bool showChild = true; // Controls the visibility of the child.
  late AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!data) {
            // When `data` is false, show the child and start forward animation.
            setState(() {
              showChild = true;
            });
            animationController.forward();
          } else {
            // When `data` is true, reverse the animation and hide the child after it completes.
            animationController.reverse().then((_) {
              setState(() {
                showChild = false;
              });
            });
          }
        });

        return SlideInLeft(
          manualTrigger: true, // Manual animation trigger.
          controller: (controller) => animationController = controller,
          child: Visibility(
            visible: showChild, // Use `Visibility` to toggle child visibility.
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyTextField(
                prefixIcon: Icons.person,
                onComplete: (p0) => '',
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller to prevent memory leaks.
    animationController.dispose();
    super.dispose();
  }
}
