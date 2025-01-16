import 'package:flutter/cupertino.dart';

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
    return const Stack(
      children: [
        SizedBox(
          width: 100,
          height: 50,
        ),
      ],
    );
  }
}
