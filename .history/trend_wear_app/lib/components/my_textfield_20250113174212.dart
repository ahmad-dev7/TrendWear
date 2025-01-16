import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String? hintText, labelText;
  final Widget? suffix;
  final bool isPasswordField;
  final Function(String?) onChange;

  const MyTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.isPasswordField = false,
    this.suffix,
    required this.prefixIcon,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return CupertinoTextField(
      controller: textController,
      prefix: Padding(padding: const EdgeInsets.only(left: 10), child: Icon(prefixIcon)),
      padding: const EdgeInsets.all(12),
      onChanged: onChange,
      onEditingComplete: () => onChange(textController.text),
      obscureText: isPasswordField,
      suffix: suffix,
    );
  }
}

class TogglePasswordVisibility {
  var toggleStreamController = StreamController<bool>();

  StreamSink<bool> get sinkVisibility => toggleStreamController.sink;
  Stream<bool> get streamVisibility => toggleStreamController.stream;
}
