import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const ButtonWidget({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - size30,
      height: size50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: AppTheme.lightTheme.elevatedButtonTheme.style,
        child: Text(
          label,
          style: AppTheme.lightText.labelMedium!.apply(color: whiteColor),
        ),
      ),
    );
  }
}
