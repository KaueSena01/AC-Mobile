import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/settings.dart';

import 'src/routes/app_pages.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await dotenv.load(fileName: ".env");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  Get.put(AuthController());

  var authController = Get.find<AuthController>();

  var router = await authController.checkTokenController();

  runApp(MyApp(
    router: router,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.router,
  }) : super(key: key);

  final String? router;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInformation.appName,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale("pt", "BR")],
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.pages,
      initialRoute: router,
    );
  }
}
