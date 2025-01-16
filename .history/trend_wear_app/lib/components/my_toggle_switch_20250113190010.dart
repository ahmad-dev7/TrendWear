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
    return Flexible(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Stack(
          children: [
            Positioned(
              left: 12,
              top: 12,
              child: Text('Login'),
            ),
            Positioned(
              right: 12,
              top: 12,
              child: Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
