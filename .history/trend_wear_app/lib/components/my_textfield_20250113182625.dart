import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String? hintText, labelText;
  final bool? isPasswordField;
  final Function(String?) onComplete;

  const MyTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPasswordField = false,
    required this.prefixIcon,
    required this.onComplete,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  var textController = TextEditingController();
  var isObscure = false;
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
      prefix: Padding(padding: const EdgeInsets.only(left: 10), child: Icon(widget.prefixIcon)),
      padding: const EdgeInsets.all(12),
      onEditingComplete: () => widget.onComplete(textController.text),
      obscureText: isObscure,
      suffix: widget.isPasswordField!
          ? IconButton(
              onPressed: () => setState(() => isObscure = !isObscure),
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.black54))
          : null,
    );
  }
}
