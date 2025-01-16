import 'package:flutter/material.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class FlipContent extends StatelessWidget {
  final Widget? nameTextfield;
  final Widget? confirmPasswordTextfield;
  final bool isSignup;
  final Function(String?) email, password;
  final Function(String?)? name;
  const FlipContent({
    super.key,
    this.name,
    this.nameTextfield,
    this.confirmPasswordTextfield,
    this.isSignup = false,
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
          if (isSignup && name != null)
            MyTextField(
              placeholder: 'Name',
              prefixIcon: Icons.person,
              onComplete: name!,
            ),
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
          if (isSignup)
            MyTextField(
              placeholder: 'Confirm password',
              isPasswordField: true,
              showSuffix: false,
              prefixIcon: Icons.lock,
              onComplete: (p0) => '',
            ),
        ],
      ),
    );
  }
}
