import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';

class SignupField extends StatelessWidget {
  final Widget textField;
  const SignupField({super.key, required this.textField});

  @override
  Widget build(BuildContext context) {
    Future<bool> showSignupField(bool isLogin) async {
      if (isLogin) {
        return Future.delayed(kAnimationDuration * 1).then((value) => true);
      } else {
        return false;
      }
    }

    return BlocBuilder<TogglerCubit, bool>(
      builder: (context, state) {
        return FutureBuilder(
          future: showSignupField(state),
          builder: (ctx, hideField) {
            if (hideField.hasData) {
              return AnimatedSize(
                duration: Durations.medium1,
                child: hideField.data!
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SlideInLeft(
                          animate: !state,
                          duration: kAnimationDuration,
                          child: textField,
                        ),
                      ),
              );
            } else {
              return const SizedBox();
            }
          },
        );
      },
    );
  }
}
