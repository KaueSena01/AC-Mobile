import 'package:atlas_coins/src/bindigs/auth_binding.dart';
import 'package:atlas_coins/src/bindigs/transaction_binding.dart';
import 'package:atlas_coins/src/features/auth/view/auth/register_screen_step_two.dart';
import 'package:atlas_coins/src/features/auth/view/splash/splash_screen.dart';
import 'package:atlas_coins/src/features/transaction/views/home/home_screen.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/new_transaction_screen_step_one.dart';
import 'package:atlas_coins/src/features/auth/view/onboarding/onboarding_screen.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.onboardingRoute,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.registerLoginRoute,
      page: () => RegisterScreenSteepTwo(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => const HomeScreen(),
      bindings: [
        AuthBinding(),
        TransactionBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.profileRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.newTransactionRoute,
      page: () => NewTransactionScreenStepOne(),
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
