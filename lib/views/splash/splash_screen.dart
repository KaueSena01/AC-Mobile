import 'package:atlas_coins/services/utils/static_values.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Image.asset( 
              AppInformation.appLogoPath,
              height: 80,
            ), 
          ),
        ),
      ),
    );
  }
}