import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class OutilineuttonWidget extends StatelessWidget {
  
  final String label;
  
  const OutilineuttonWidget({ 
    Key? key,
    required this.label 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 30),     
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.white,
          side: const BorderSide(width: 1.5, color:primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ), 
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: primaryColor,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}