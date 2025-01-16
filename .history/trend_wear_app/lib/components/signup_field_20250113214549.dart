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

class _SignupFieldState extends State<SignupField> {
  bool hideChild = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        if (!data) {
          Future.delayed(kAnimationDuration * 1.1).then((value) => setState(() => hideChild = false));
        } else {
          hideChild = data;
        }
        return SlideInLeft(
          animate: !data,
          from: 20,
          // onFinish: (_) => setState(() => hideChild = false),
          duration: kAnimationDuration,
          child: hideChild
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: MyTextField(prefixIcon: Icons.person, onComplete: (p0) => ''),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
