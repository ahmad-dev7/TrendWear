import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      width: 130,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.pink,
            height: 40,
            width: 65,
          ),
          const Positioned(
            left: 15,
            top: 12,
            child: Text('Login'),
          ),
          const Positioned(
            right: 15,
            top: 12,
            child: Text('Signup'),
          ),
        ],
      ),
    );
  }
}
