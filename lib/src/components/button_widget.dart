import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final bool border;
  final bool circularIndicator;
  final EdgeInsetsGeometry? margin;

  const ButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width = 0.0,
    this.height = 0.0,
    this.backgroundColor = primaryColor,
    this.border = true,
    this.margin,
    this.circularIndicator = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size45,
      width: width,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: size30),
          backgroundColor: backgroundColor,
          side: border
              ? BorderSide(
                  color: onPressed == null ? labelColor : primaryColor,
                )
              : null,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: circularIndicator
            ? const CircularProgressIndicator(
                color: whiteColor,
                strokeWidth: 2.0,
              )
            : Text(
                label,
                style: AppTheme.lightText.headlineMedium!.apply(
                  color: onPressed == null ? labelColor : whiteColor,
                ),
              ),
      ),
    );
  }
}
