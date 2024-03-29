import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/arrow_back_widget.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({
    Key? key,
    required this.onPressed,
    this.title = "",
  }) : super(key: key);

  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(size05, size20, size05, size00),
      padding: const EdgeInsets.all(size00),
      height: size35,
      color: Colors.transparent,
      child: Row(
        children: [
          ArrowBackWidget(
            onPressed: onPressed,
          ),
          const SizedBox(width: size10),
          Text(
            title,
            style: AppTheme.lightText.titleMedium!.apply(
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
