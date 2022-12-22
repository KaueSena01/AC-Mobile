import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size50,
      padding: const EdgeInsets.symmetric(horizontal: size15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(size20, 0, size20, 0),
          filled: true,
          fillColor: cardBackgroundColor,
          isDense: false,
          hintText: description,
          hintStyle: AppTheme.lightText.headlineSmall!.apply(
            color: labelColor,
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: primaryColor,
          ),
          suffixIconColor: backgroundColor,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(size30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: cardBackgroundColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(size30),
          ),
        ),
      ),
    );
  }
}
