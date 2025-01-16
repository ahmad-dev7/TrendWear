import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupField extends StatelessWidget {
  const SignupField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, state) {
        return FutureBuilder(
          future: showSignupField(state),
          builder: (ctx, showFields) {
            if (!showFields.data!) {
              return SlideInLeft(
                animate: !state,
                duration: kAnimationDuration,
                child: MyTextField(
                  prefixIcon: Icons.person_outlined,
                  onComplete: (_) {},
                ),
              ).pad.py16.make();
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}

Future<bool> showSignupField(bool isLogin) async {
  if (isLogin) {
    return Future.delayed(kAnimationDuration * 1.2).then((value) => true);
  } else {
    return false;
  }
}
