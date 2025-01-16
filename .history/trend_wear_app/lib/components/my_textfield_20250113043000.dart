import 'package:flutter/cupertino.dart';

class MyTextField extends StatelessWidget {
  final Widget? suffix;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? hintText, labelText;
  final Function(String?) onChange;

  const MyTextField({
    super.key,
    this.suffix,
    this.suffixIcon,
    this.hintText,
    this.labelText,
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
        suffix: suffix ?? Icon(suffixIcon),
      ),
    );
  }
}
