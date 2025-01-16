import 'package:flutter/material.dart';
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<TogglerCubit, bool>(
        builder: (context, data) {
          return Stack(
            children: [
              AnimatedAlign(
                duration: Durations.short3,
                alignment: data ? Alignment.centerLeft : Alignment.centerRight,
                child: Container(
                  height: 48,
                  width: 95,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.read<TogglerCubit>().toggle(true),
                    child: Container(
                      padding: const EdgeInsets.only(left: 25),
                      alignment: Alignment.centerLeft,
                      child: 'Login'.text.fontWeight(FontWeight.w500).color(data ? Colors.white : Colors.black).make(),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => context.read<TogglerCubit>().toggle(false),
                    child: AnimatedContainer(
                      duration: kAnimationDuration,
                      padding: const EdgeInsets.only(right: 25),
                      alignment: Alignment.centerRight,
                      child: 'Signup'.text.fontWeight(FontWeight.w500).color(data ? Colors.black : Colors.white).make(),
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
