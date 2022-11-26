import 'package:atlas_coins/src/bindigs/auth_binding.dart';
import 'package:atlas_coins/src/bindigs/transaction_binding.dart';
import 'package:atlas_coins/src/features/transaction/views/home/home_screen.dart';
import 'package:atlas_coins/src/features/user/views/auth/save_email_and_password_screen.dart';
import 'package:atlas_coins/src/features/user/views/auth/save_name_screen.dart';
import 'package:atlas_coins/src/features/user/views/onboarding/onboarding_screen.dart';
import 'package:atlas_coins/src/features/user/views/splash/splash_screen.dart';
import 'package:atlas_coins/src/features/user/views/user/user_profile_screen.dart';
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

abstract class AppRoutes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String registerNameRoute = '/register';
  static const String registerLoginRoute = '/registerLogin';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
  static const String newTransactionRoute = '/newTransaction';
}
