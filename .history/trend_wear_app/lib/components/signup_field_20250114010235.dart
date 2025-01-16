import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

class SignupField extends StatefulWidget {
  final Widget child;
  const SignupField({super.key, required this.child});

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;
  late Animation<double> fadeAnimation;
  bool showChild = true;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );

    // Create vertical slide animation (Y-axis offset)
    slideAnimation = Tween<double>(begin: -50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );

    // Create fade animation
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TogglerCubit, bool>(
      listener: (context, data) {
        // Trigger animations based on the Bloc state
        if (!data && !showChild) {
          setState(() {
            showChild = true;
          });
          controller.forward(); // Play forward animation
          debugPrint("Played forward animation");
        } else if (data && showChild) {
          controller.reverse().then((_) {
            setState(() {
              showChild = false;
            });
          });
          debugPrint("Played reverse animation");
        }
      },
      child: BlocBuilder<TogglerCubit, bool>(
        builder: (context, data) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(0, slideAnimation.value), // Apply vertical translation
                child: Opacity(
                  opacity: fadeAnimation.value, // Apply fade effect
                  child: Visibility(
                    visible: showChild,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: widget.child,
                    ),
                  ),
                ),
              );
            },
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
