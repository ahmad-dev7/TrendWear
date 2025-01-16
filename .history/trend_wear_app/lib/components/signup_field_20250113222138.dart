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
  bool hideChild = true;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (data && !hideChild) {
            setState(() {
              hideChild = true;
            });
          }
        });
        return SlideInLeft(
          //animate: !data,
          manualTrigger: true,
          controller: (_) => animationController = _,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Visibility(
              visible: hideChild,
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
}
