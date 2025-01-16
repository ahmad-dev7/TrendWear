import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTextField extends StatefulWidget {
  final IconData prefixIcon;
  final String placeholder;
  final TextInputType? inputType;
  final bool isPasswordField, showSuffix;
  final Function(String?) onComplete;

  const MyTextField({
    super.key,
    this.isPasswordField = false,
    this.showSuffix = true,
    this.inputType = TextInputType.text,
    required this.prefixIcon,
    required this.onComplete,
    required this.placeholder,
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
    return CupertinoTextFormFieldRow(
      controller: textController,
      placeholder: widget.placeholder,
      keyboardType: widget.inputType,
      textCapitalization: widget.inputType == TextInputType.name ? TextCapitalization.words : TextCapitalization.none,
      prefix: widget.placeholder.text.makeCentered().pad.px4.make(),
      padding: const EdgeInsets.all(12),
      onEditingComplete: () => widget.onComplete(textController.text),
      obscureText: isObscure,
      decoration: BoxDecoration(
        border: Border.all(width: .12),
      ),
      // suffix: widget.isPasswordField && widget.showSuffix
      //     ? CupertinoButton(
      //         padding: const EdgeInsets.all(0),
      //         onPressed: () => setState(() => isObscure = !isObscure),
      //         child: Icon(
      //           isObscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
      //           color: CupertinoColors.black.withOpacity(.6),
      //         ),
      //       )
      //     : null,
    );
  }
}
