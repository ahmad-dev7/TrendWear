import 'package:flutter/material.dart';
import 'package:trend_wear_app/constants/custom_text.dart';
import 'package:trend_wear_app/constants/k_constants.dart';

class MyToggleSwitch extends StatefulWidget {
  const MyToggleSwitch({super.key});

  @override
  State<MyToggleSwitch> createState() => _MyToggleSwitchState();
}

class _MyToggleSwitchState extends State<MyToggleSwitch> {
  var loginChipKey = GlobalKey();
  var signupChipKey = GlobalKey();
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
            alignment: Alignment.centerRight,
            child: Container(
              height: 48,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: const CustomText('Login', fontWeight: FontWeight.w500),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.centerRight,
            child: const CustomText('Signup', fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
