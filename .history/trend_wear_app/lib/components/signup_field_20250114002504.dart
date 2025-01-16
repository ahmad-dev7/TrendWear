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
  late AnimationController controller;
  bool showChild = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (!data) {
            setState(() {
              showChild = true;
              controller.forward();
            });
          }
          if (data) {
            controller.reverse().then((value) => setState(() => showChild = false));
          }
        });
        return SlideInLeft(
          animate: !data,
          onFinish: (direction) => debugPrint("Hello"),
          manualTrigger: true,
          controller: (p0) => controller = p0,
          child: !showChild
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: MyTextField(
                    placeholder: 'Name',
                    prefixIcon: Icons.person,
                    onComplete: (p0) => '',
                  ),
                ),
        );
      },
    );
  }
}
