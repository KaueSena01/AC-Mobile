import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/constants.dart';

class ArrowBackWidget extends StatelessWidget {
  final void Function()? onPressed;

  const ArrowBackWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size70),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(size15, size10, size05, size10),
        child: Icon(
          Icons.arrow_back_ios,
          color: whiteColor,
          size: size15,
        ),
      ),
    );
  }
}
