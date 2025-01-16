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
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (!data && !showChild) {
            // When data is false and the child is not shown, start the animation and show the child
            setState(() {
              showChild = true;
            });
            controller.forward();
          } else if (data && showChild) {
            // When data is true and the child is shown, reverse the animation and hide the child
            controller.reverse().then((_) {
              setState(() {
                showChild = false;
              });
            });
          }
        });

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return SlideInLeft(
              manualTrigger: true,
              controller: (p0) => controller = p0,
              animate: false, // We're manually controlling the animation
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
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
