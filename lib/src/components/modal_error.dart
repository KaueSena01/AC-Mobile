import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<T?> bottomSheet<T>({
  required String message,
  required double height,
  required void Function()? onPressed,
}) {
  return Get.bottomSheet(
    Container(
      height: height,
      padding: const EdgeInsets.all(size20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size30),
          topRight: Radius.circular(size30),
        ),
        color: cardBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  "assets/icons/fox.png",
                  height: size100,
                  width: size100,
                ),
                const SizedBox(
                  height: size20,
                ),
                Text(
                  "Ops, aconteceu um erro",
                  style: AppTheme.lightText.titleMedium!.apply(
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height / size10),
                Text(
                  message,
                  style: AppTheme.lightText.displaySmall!.apply(
                    color: whiteColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ButtonWidget(
            margin: const EdgeInsets.fromLTRB(size15, size20, size15, size00),
            label: 'Fechar',
            backgroundColor: expenseColor,
            onPressed: onPressed,
          ),
        ],
      ),
    ),
  );
}

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
          margin: const EdgeInsets.fromLTRB(size15, size20, size15, size00),
          label: 'Fechar',
          backgroundColor: expenseColor,
          onPressed: onPressed,
        ),
      ],
    ),
  );
}
