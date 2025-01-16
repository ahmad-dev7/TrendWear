import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend_wear_app/constants/k_constants.dart';
import 'package:trend_wear_app/cubit/toggler_cubit.dart';
import 'package:velocity_x/velocity_x.dart';

class MyToggleSwitch extends StatelessWidget {
  const MyToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      width: 180,
      height: 50,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<TogglerCubit, bool>(
        builder: (context, data) {
          return Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 300),
                alignment: data ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  height: 48,
                  width: 95,
                  decoration: BoxDecoration(
                    //color: CupertinoColors.activeBlue,
                    gradient: kGradient,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: CupertinoColors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () => context.read<TogglerCubit>().toggle(true),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.centerLeft,
                      child: 'Login'
                          .text
                          .fontWeight(FontWeight.w500)
                          .color(data ? CupertinoColors.white : CupertinoColors.black)
                          .make(),
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () => context.read<TogglerCubit>().toggle(false),
                    child: Container(
                      padding: const EdgeInsets.only(right: 25),
                      alignment: Alignment.centerRight,
                      child: 'Signup'
                          .text
                          .fontWeight(FontWeight.w500)
                          .color(data ? CupertinoColors.black : CupertinoColors.white)
                          .make(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
