import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';

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

  AuthController authController = Get.put(AuthController());

  String? page = await authController.checkDeviceSettings();

  runApp(
    ManagePAY(
      page: page,
    ),
  );
}

class ManagePAY extends StatelessWidget {
  const ManagePAY({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String? page;

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
      initialRoute: page,
    );
  }
}
