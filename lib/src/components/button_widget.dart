import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final void Function()? onPressed;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;

  const ButtonWidget({
    Key? key,
    required this.label,
    this.backgroundColor = primaryColor,
    required this.onPressed,
    this.marginTop = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size45,
      margin:
          EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: size30),
          backgroundColor: backgroundColor,
          side: BorderSide(color: backgroundColor),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: AppTheme.lightText.headlineMedium!.apply(color: whiteColor),
        ),
      ),
    );
  }
}
