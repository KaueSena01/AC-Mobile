import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:atlas_coins/src/theme/constants.dart';

class AppTheme {
  static const TextTheme lightText = TextTheme(
    // display
    displayLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    displayMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    displaySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    // label
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      fontFamily: 'Poppins',
    ),
    // headline
    headlineLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    headlineMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    // title
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    titleSmall: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    ),
    // body
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins',
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(),
    brightness: Brightness.light,
    canvasColor: primaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
      background: backgroundColor,
    ),
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        side: const BorderSide(
          width: 2.0,
          color: primaryColor,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}
