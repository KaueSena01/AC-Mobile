import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  final void Function()? onPressed;

  const ArrowBackWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: SafeArea(
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: darkColor,
          ),
        ),
      ),
    );
  }
}
