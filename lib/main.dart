import 'package:balanced/theme/colors_theme.dart';
import 'package:balanced/views/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BALANCED',
      theme: ThemeData( 
        primarySwatch: MaterialColor(0xFF0A3470, primarySwatch)
      ),
      home: const LoginScreen(),
    );
  }
}