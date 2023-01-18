import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> defaultDialog<T>({
  required String message,
  required void Function()? onPressed,
}) {
  return Get.defaultDialog(
    title: 'Ops...',
    backgroundColor: cardBackgroundColor,
    titleStyle: AppTheme.lightText.displayMedium!.apply(
      color: whiteColor,
    ),
    titlePadding: const EdgeInsets.only(top: size10),
    // contentPadding: const EdgeInsets.all(size20),
    radius: size05,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          message,
          style: AppTheme.lightText.displaySmall!.apply(
            color: whiteColor,
          ),
          textAlign: TextAlign.center,
        ),
        ButtonWidget(
          marginTop: size20,
          marginLeft: size15,
          marginRight: size15,
          label: 'Fechar',
          backgroundColor: expenseColor,
          onPressed: onPressed,
        ),
      ],
    ),
  );
}
