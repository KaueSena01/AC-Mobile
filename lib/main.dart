import 'package:atlas_coins/src/controllers/auth_controller.dart';
import 'package:atlas_coins/src/router/app_pages.dart';
import 'package:atlas_coins/src/router/app_routes.dart';
import 'package:atlas_coins/src/services/utils/static_values.dart';
import 'package:atlas_coins/src/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInformation.appName,
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
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splashRoute,
    );
  }
}