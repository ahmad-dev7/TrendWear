import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Container(
      width: 160,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: kAnimationDuration,
            top: 5,
            right: 5,
            child: Container(
              height: 35,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('Login'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: const Text('Signup'),
          ),
        ],
      ),
    );
  }
}
