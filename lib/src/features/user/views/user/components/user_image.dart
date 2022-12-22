import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key, this.marginBottom = 0.0}) : super(key: key);

  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      height: size90,
      width: size90,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(size50),
      ),
      child: const CircleAvatar(
        backgroundColor: cardBackgroundColor,
        backgroundImage: NetworkImage(
          'https://avatars.githubusercontent.com/u/86299739?v=4',
        ),
      ),
    );
  }
}
