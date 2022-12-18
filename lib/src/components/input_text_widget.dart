import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatefulWidget {
  final String? placeholder;
  final String? label;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool? hint;
  final bool readOnly;
  final bool? isDescription;
  final bool? isDate;

  const InputTextWidget({
    Key? key,
    this.placeholder,
    this.label,
    this.controller,
    this.validator,
    this.initialValue,
    this.hint = false,
    this.readOnly = false,
    this.isDescription = false,
    this.isDate = false,
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
        if (widget.hint!)
          Text(
            widget.label!,
            style: const TextStyle(
              color: tertiaryColor,
              fontSize: 17,
            ),
          ),
        SizedBox(
          height: !widget.isDescription! ? size50 : null,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            minLines: widget.isDescription! ? 3 : null,
            maxLines: widget.isDescription! ? 4 : null,
            inputFormatters: !widget.isDate!
                ? null
                : [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
            decoration: InputDecoration(
              isDense: false,
              hintText: widget.placeholder,
              hintStyle: AppTheme.lightText.displaySmall!.apply(
                color: tertiaryColor,
              ),
              border: const UnderlineInputBorder(),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: tertiaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: tertiaryColor,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
