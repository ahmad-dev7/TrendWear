import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

class SignupField extends StatefulWidget {
  const SignupField({super.key});

  @override
  State<SignupField> createState() => _SignupFieldState();
}

class _SignupFieldState extends State<SignupField> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;
  bool showChild = false;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    controller = AnimationController(
      vsync: this,
      duration: kAnimationDuration,
    );

    // Create a custom slide animation
    slideAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
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
          controller.forward(); // Play the forward animation
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
            animation: slideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(slideAnimation.value * MediaQuery.of(context).size.width, 0),
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
