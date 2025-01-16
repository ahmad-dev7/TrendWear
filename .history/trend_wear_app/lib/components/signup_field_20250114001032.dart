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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, data) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
        return SlideInLeft(
          animate: !data,
          from: 600,
          onFinish: (direction) => debugPrint("Hello"),
          child: data
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
