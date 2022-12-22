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
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(size70),
      child: const Padding(
        padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
        child: Icon(
          Icons.arrow_back_ios,
          color: whiteColor,
          size: size15,
        ),
      ),
    );
  }
}
