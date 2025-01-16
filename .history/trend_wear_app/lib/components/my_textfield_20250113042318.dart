import 'package:flutter/cupertino.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 45,
      child: CupertinoTextField(
        cursorHeight: 30,
      ),
    );
  }
}
