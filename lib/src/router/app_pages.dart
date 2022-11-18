import 'package:atlas_coins/src/bindigs/auth_binding.dart';
import 'package:atlas_coins/src/bindigs/transaction_binding.dart';
import 'package:atlas_coins/src/router/app_routes.dart';
import 'package:atlas_coins/src/views/auth/save_email_and_password_screen.dart';
import 'package:atlas_coins/src/views/auth/save_name_screen.dart';
import 'package:atlas_coins/src/views/home/home_screen.dart';
import 'package:atlas_coins/src/views/onboarding/onboarding_screen.dart';
import 'package:atlas_coins/src/views/splash/splash_screen.dart';
import 'package:atlas_coins/src/views/user/user_profile_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboardingRoute,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.registerNameRoute,
      page: () => SaveNameScreen(),
    ),
    GetPage(
      name: AppRoutes.registerLoginRoute,
      page: () => SaveEmailAndPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => const HomeScreen(),
      bindings: [
        TransactionBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.profileRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.newTransactionRoute,
      page: () => const UserProfileScreen(),
    ),
  ];
}
