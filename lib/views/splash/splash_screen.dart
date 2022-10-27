import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.9,
              ],
              colors: [
                primaryColor,
                secondaryColor 
              ]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              Expanded(
                child: Image.asset( 
                  'assets/images/logo_key.png',
                  height: 200,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text('By Kauê Sena', style: TextStyle(
                  color: ligthColor
                ))
              )
            ],
          ),
        ),
      ),
    );
  }
}