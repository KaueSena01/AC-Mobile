import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const TextTheme lightText = TextTheme(
    // display
    displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    // label
    labelLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    labelMedium: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    labelSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
    // headline
    headlineLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    headlineSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    // title
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
    // body
    bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
  );

  static final ThemeData lightTheme = ThemeData(
    cupertinoOverrideTheme: const CupertinoThemeData(),
    brightness: Brightness.light,
    canvasColor: primaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: ligthColor,
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
          color: secondaryDarkColor,
          width: 2,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: secondaryDarkColor,
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
