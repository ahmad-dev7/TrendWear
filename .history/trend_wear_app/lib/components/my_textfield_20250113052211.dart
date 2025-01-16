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
    var toggleBloc = TogglePasswordVisibility();
    return StreamBuilder<bool>(
      stream: toggleBloc.streamVisibility,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          var showPassword = snapShot.data!;
          return CupertinoTextField(
            // cursorHeight: 32,
            // controller: textController,
            // prefix: Icon(prefixIcon),
            // onChanged: onChange,
            // onEditingComplete: () => onChange(textController.text),
            // obscureText: snapShot.hasData ? snapShot.data! : false,
            suffix: IconButton(
              onPressed: () {
                toggleBloc.sinkVisibility.add(!showPassword);
              },
              icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            ),
          );
        } else {
          toggleBloc.sinkVisibility.add(false);
          return const CupertinoActivityIndicator();
        }
      },
    );
  }
}

class TogglePasswordVisibility {
  var toggleStreamController = StreamController<bool>();

  StreamSink<bool> get sinkVisibility => toggleStreamController.sink;
  Stream<bool> get streamVisibility => toggleStreamController.stream;
}
