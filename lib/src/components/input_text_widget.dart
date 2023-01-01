import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextWidget extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? initialValue;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final TextInputType textInputType;
  final String? label;
  final String? placeholder;
  final bool? isDescription;
  final bool? isDate;

  const InputTextWidget({
    Key? key,
    this.controller,
    this.validator,
    this.initialValue,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.textInputType = TextInputType.text,
    this.label = "",
    this.placeholder,
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
        SizedBox(
          height: !widget.isDescription! ? size60 : null,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            initialValue: widget.initialValue,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            readOnly: widget.readOnly,
            keyboardType: widget.textInputType,
            cursorColor: whiteColor,
            style: AppTheme.lightText.headlineSmall!.apply(
              color: whiteColor,
            ),
            inputFormatters: !widget.isDate!
                ? null
                : [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: AppTheme.lightText.labelSmall!.apply(
                color: labelColor,
              ),
              isDense: true,
              hintText: widget.placeholder,
              floatingLabelStyle: AppTheme.lightText.labelLarge!.apply(
                color: primaryColor,
              ),
              border: const UnderlineInputBorder(),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: labelColor,
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
