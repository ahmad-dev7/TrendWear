import 'package:flutter/material.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class FlipContent extends StatelessWidget {
  final Widget? nameTextfield;
  final Widget? confirmPasswordTextfield;
  final Function(String?) email, password;
  const FlipContent({
    super.key,
    this.nameTextfield,
    this.confirmPasswordTextfield,
    required this.email,
    required this.password,
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
          MyTextField(
            placeholder: 'Email',
            prefixIcon: Icons.email,
            onComplete: email,
          ),
          const SizedBox(height: 15),
          MyTextField(
            placeholder: 'Password',
            prefixIcon: Icons.lock,
            onComplete: password,
            isPasswordField: true,
          ),
          if (confirmPasswordTextfield != null) confirmPasswordTextfield!,
        ],
      ),
    );
  }
}
