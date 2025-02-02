import 'package:flutter/material.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class FlipContainer extends StatelessWidget {
  final Widget? nameTextfield;
  final Widget? confirmPasswordTextfield;
  final List<Widget> emailAndPasswordTextField;
  const FlipContainer({
    super.key,
    this.nameTextfield,
    this.confirmPasswordTextfield,
    required this.emailAndPasswordTextField,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      width: double.maxFinite,
      padding: EdgeInsets.all(kScreenMargin),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: kBoxShadow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const MyToggleSwitch(),
          if (nameTextfield != null) nameTextfield!,
          ...emailAndPasswordTextField,
          if (confirmPasswordTextfield != null) confirmPasswordTextfield!,
        ],
      ),
    );
  }
}
