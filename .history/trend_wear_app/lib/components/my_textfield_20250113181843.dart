import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String? hintText, labelText;
  final bool? isPasswordField;
  final Function(String?) onComplete;

  const MyTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPasswordField,
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
      obscureText: isPasswordField == null ? false : isPasswordField!,
      suffix: isPasswordField != null
          ? IconButton(onPressed: () {}, icon: Icon(isPasswordField! ? Icons.visibility : Icons.visibility_off))
          : null,
    );
  }
}
