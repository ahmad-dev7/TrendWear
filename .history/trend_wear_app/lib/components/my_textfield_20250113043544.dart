import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? hintText, labelText;
  final bool? isPasswordField;
  final Function(String?) onChange;

  const MyTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPasswordField,
    this.suffixIcon,
    required this.prefixIcon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return SizedBox(
      height: 45,
      child: CupertinoTextField(
        cursorHeight: 30,
        controller: textController,
        prefix: Icon(prefixIcon),
        obscureText: isPasswordField ?? false,
        suffix: suffixIcon == null
            ? IconButton(
                onPressed: () {
                  debugPrint("Hello World");
                },
                icon: Icon(Icons.visibility_off))
            : Icon(suffixIcon),
      ),
    );
  }
}
