import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 1.5,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'OU',
              style: TextStyle(
                color: primaryColor,
                fontSize: 14
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
                thickness: 1.5,
              ),
            ),
          ],
        ),
    );


      
  }
}