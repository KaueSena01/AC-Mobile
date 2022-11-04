import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {

  final String? placeholder;
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? hint;
  final bool readOnly;

  const InputTextWidget({
    Key? key,
    this.placeholder,
    this.label,
    this.controller,
    this.validator,
    this.initialValue,
    this.hint = false,
    this.readOnly = false
  }) : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if(widget.hint!)
          Text(widget.label!,
            style: const TextStyle(
              color: darkColor,
              fontSize: 18
            )
          ), 
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          initialValue: widget.initialValue,
          readOnly: widget.readOnly,
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
        ),
      ],
    );
  }
}
