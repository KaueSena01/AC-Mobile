import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {

  final String placeholder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;

  const InputTextWidget({
    Key? key,
    required this.placeholder,
    this.controller,
    this.validator,
    this.initialValue
  }) : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      initialValue: widget.initialValue,
      decoration: InputDecoration(
        isDense: false,
        hintText: widget.placeholder,
        hintStyle: const TextStyle(color: mainDarkColor, fontSize: 16),
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: mainDarkColor, width: 2)),
          enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: mainDarkColor, width: 2)
        )
      )
    );
  }
}
