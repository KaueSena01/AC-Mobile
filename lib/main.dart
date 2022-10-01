import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:atlas_coins/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'atlas_coins',
      theme: ThemeData( 
        primarySwatch: MaterialColor(0xFF0A3470, primarySwatch)
      ),
      home:  LoginScreen(),
    );
  }
}