import 'package:flutter/cupertino.dart';

class MyTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String? hintText, labelText;
  final Widget? suffix;
  final bool isPasswordField;
  final Function(String?) onComplete;

  const MyTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPasswordField = false,
    this.suffix,
    required this.prefixIcon,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return CupertinoTextField(
      controller: textController,
      prefix: Padding(padding: const EdgeInsets.only(left: 10), child: Icon(prefixIcon)),
      padding: const EdgeInsets.all(12),
      onEditingComplete: () => onComplete(textController.text),
      obscureText: isPasswordField,
      suffix: suffix,
    );
  }
}
