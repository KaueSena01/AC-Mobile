import 'package:atlas_coins/src/theme/colors_theme.dart';
import 'package:flutter/material.dart'; 

class HeadWidget extends StatelessWidget {
  const HeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea( 
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Painel", style: TextStyle(
              color: primaryColor,
              fontSize: 22, 
              fontWeight: FontWeight.w500
            )), 
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 10, left: 0),
              height: 3,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: ligthColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}