import 'package:flutter/material.dart';
import 'package:trend_wear_app/components/my_textfield.dart';
import 'package:trend_wear_app/components/my_toggle_switch.dart';
import 'package:trend_wear_app/constants/custom_text.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class FlipContent extends StatelessWidget {
  final bool isSignup;
  final Function(String?, String?) emailPassword;
  final Function(String?)? name;
  const FlipContent({
    super.key,
    this.name,
    this.isSignup = false,
    required this.emailPassword,
  });

  @override
  Widget build(BuildContext context) {
    var emailAndPassword = <String?>[];
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
          SizedBox(height: kScreenMargin),
          if (isSignup && name != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: MyTextField(
                placeholder: 'Name',
                prefixIcon: Icons.person,
                onComplete: name!,
              ),
            ),
          MyTextField(
            placeholder: 'Email',
            prefixIcon: Icons.email,
            onComplete: (email) => emailAndPassword.insert(0, email),
          ),
          const SizedBox(height: 15),
          MyTextField(
            placeholder: 'Password',
            prefixIcon: Icons.lock,
            onComplete: (password) => emailAndPassword.insert(1, password),
            isPasswordField: true,
          ),
          if (isSignup)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MyTextField(
                placeholder: 'Confirm password',
                isPasswordField: true,
                showSuffix: false,
                prefixIcon: Icons.lock,
                onComplete: (p0) => '',
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top: kScreenMargin),
            child: ElevatedButton(
              onPressed: () {},
              child: CustomText(isSignup ? 'Sign up' : 'Login'),
            ),
          )
        ],
      ),
    );
  }
}
