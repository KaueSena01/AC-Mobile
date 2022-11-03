import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:atlas_coins/views/auth/login_screen.dart';
import 'package:atlas_coins/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  // Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ATLAS COINS',
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("pt", "BR")
      ],
      theme: ThemeData( 
        primarySwatch: MaterialColor(0xFF0A3470, primarySwatch)
      ),
      // home: LoginScreen(),
      home: SplashScreen()
    );
  }
}