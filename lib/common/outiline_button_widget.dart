import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class OutilineuttonWidget extends StatelessWidget {
  
  final String label;
  final void Function()? onPressed;
  
  const OutilineuttonWidget({ 
    Key? key,
    required this.label,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 30,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          side: const BorderSide(
            width: 2.0, color: primaryColor, style: BorderStyle.solid
          )
        ),
        child: Text(label, style: const TextStyle(
          color: ligthColor, 
          fontSize: 15, 
          fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}