import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';

class OutilineButtonWidget extends StatelessWidget {
  final String label;
  final Color? color;
  final void Function()? onPressed;

  const OutilineButtonWidget(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.color = lightColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - size30,
      height: size50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: AppTheme.lightTheme.outlinedButtonTheme.style,
        child: Text(
          label,
          style: AppTheme.lightText.labelMedium!.apply(color: color),
        ),
      ),
    );
  }
}
