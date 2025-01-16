import 'package:flutter/material.dart';
import 'package:trend_wear_app/constants/custom_text.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class MyToggleSwitch extends StatefulWidget {
  const MyToggleSwitch({super.key});

  @override
  State<MyToggleSwitch> createState() => _MyToggleSwitchState();
}

class _MyToggleSwitchState extends State<MyToggleSwitch> {
  bool login = true;
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
      child: Stack(
        children: [
          AnimatedAlign(
            duration: kAnimationDuration,
            alignment: login ? Alignment.centerLeft : Alignment.centerRight,
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
          InkWell(
            onTap: () => login ? null : setState(() => login = false),
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              child: const CustomText('Login', fontWeight: FontWeight.w500),
            ),
          ),
          InkWell(
            onTap: () => !login ? null : setState(() => login = true),
            child: Container(
              padding: const EdgeInsets.only(right: 25),
              alignment: Alignment.centerRight,
              child: const CustomText('Signup', fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
