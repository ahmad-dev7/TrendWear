import 'dart:async';

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
    var obsecure = isPasswordField;
    var toggleBloc = TogglePasswordVisibility();
    return SizedBox(
      height: 45,
      child: StreamBuilder<bool>(
        stream: toggleBloc.streamVisibility,
        builder: (context, snapShot) {
          return CupertinoTextField(
            cursorHeight: 30,
            controller: textController,
            prefix: Icon(prefixIcon),
            onChanged: onChange,
            onEditingComplete: () => onChange(textController.text),
            obscureText: snapShot.data ?? false,
            suffix: suffixIcon == null
                ? IconButton(
                    onPressed: () {
                      obsecure = !obsecure!;
                      toggleBloc.sinkVisibility.add(obsecure!);
                    },
                    icon: const Icon(Icons.visibility_off),
                  )
                : Icon(suffixIcon),
          );
        },
      ),
    );
  }
}

class TogglePasswordVisibility {
  var toggleStreamController = StreamController<bool>();

  StreamSink<bool> get sinkVisibility => toggleStreamController.sink;
  Stream<bool> get streamVisibility => toggleStreamController.stream;
}
