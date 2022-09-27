import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
              thickness: 2,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'OU',
              style: TextStyle(
                color: primaryColor,
                fontSize: 15
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey.withAlpha(90),
                thickness: 2,
              ),
            ),
          ],
        ),
      );


      
  }
}