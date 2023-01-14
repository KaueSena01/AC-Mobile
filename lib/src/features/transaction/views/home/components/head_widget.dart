import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Extrato",
              style: AppTheme.lightText.bodyLarge!.apply(
                color: primaryColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 0, left: 0),
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: tertiaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
