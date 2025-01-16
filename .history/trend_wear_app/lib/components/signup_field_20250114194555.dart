import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupField extends StatelessWidget {
  final Widget textField;
  const SignupField({super.key, required this.textField});

  @override
  Widget build(BuildContext context) {
    var animationDuration = kAnimationDuration * 2;
    Future<bool> showSignupField(bool isLogin) async {
      if (isLogin) {
        return Future.delayed(kAnimationDuration * 2.2).then((value) => true);
      } else {
        return false;
      }
    }

    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, state) {
        return FutureBuilder(
          future: showSignupField(state),
          builder: (ctx, showFields) {
            if (!showFields.data!) {
              return FadeInLeft(
                animate: !state,
                duration: animationDuration,
                child: textField,
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
