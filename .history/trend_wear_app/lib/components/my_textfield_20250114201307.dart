import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String? placeholder;
  final TextInputType? inputType;
  final bool isPasswordField, showSuffix;
  final Function(String?) onComplete;

  const MyTextField({
    super.key,
    this.placeholder,
    this.isPasswordField = false,
    this.showSuffix = true,
    this.inputType = TextInputType.text,
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
  void initState() {
    isObscure = widget.isPasswordField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: textController,
      placeholder: widget.placeholder,
      keyboardType: widget.inputType,
      textCapitalization: widget.inputType == TextInputType.name ? TextCapitalization.words : TextCapitalization.none,
      prefix: Padding(padding: const EdgeInsets.only(left: 10), child: Icon(widget.prefixIcon)),
      padding: const EdgeInsets.all(12),
      onEditingComplete: () => widget.onComplete(textController.text),
      obscureText: isObscure,
      suffix: widget.isPasswordField && widget.showSuffix
          ? IconButton(
              onPressed: () => setState(() => isObscure = !isObscure),
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off, color: Colors.black54))
          : null,
    );
  }
}
