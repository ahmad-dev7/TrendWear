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

class _SignupFieldState extends State<SignupField> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool showChild = true;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Define the animation duration
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TogglerCubit, bool>(
      listener: (context, data) {
        // Handle animation based on Bloc state
        if (!data && !showChild) {
          setState(() {
            showChild = true; // Make the child visible
          });
          controller.forward(); // Play animation forward
          debugPrint("Played forward animation");
        } else if (data && showChild) {
          controller.reverse().then((_) {
            setState(() {
              showChild = false; // Hide the child after animation completes
            });
          });
          debugPrint("Played reverse animation");
        }
      },
      child: BlocBuilder<TogglerCubit, bool>(
        builder: (context, data) {
          return SlideInLeft(
            manualTrigger: true,
            from: 0,
            controller: (p0) => controller = p0,
            animate: false, // Disable default animation, control it manually
            child: Visibility(
              visible: showChild,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: MyTextField(
                  placeholder: 'Name',
                  prefixIcon: Icons.person,
                  onComplete: (p0) => '',
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
