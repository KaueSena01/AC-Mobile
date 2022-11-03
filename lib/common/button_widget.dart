import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  final String label;
  final void Function()? onPressed;

  const ButtonWidget({
    Key? key, 
    required this.label,
    required this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
              color: ligthColor, fontSize: 15, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
