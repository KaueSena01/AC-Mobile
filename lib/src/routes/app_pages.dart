import 'package:atlas_coins/src/features/auth/view/auth/login_screen.dart';
import 'package:atlas_coins/src/features/auth/view/auth/register_screen_step_one.dart';
import 'package:atlas_coins/src/features/auth/view/auth/register_screen_step_two.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/bindigs/auth_binding.dart';
import 'package:atlas_coins/src/bindigs/transaction_binding.dart';
import 'package:atlas_coins/src/features/auth/view/splash/splash_screen.dart';
import 'package:atlas_coins/src/features/transaction/views/home/home_screen.dart';
import 'package:atlas_coins/src/features/user/views/user/user_profile_screen.dart';
import 'package:atlas_coins/src/features/auth/view/onboarding/onboarding_screen.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/new_transaction_screen_step_one.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      binding: AuthBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.onboardingRoute,
      page: () => const OnboardingScreen(),
      transition: Transition.cupertino,
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.registerNameRoute,
      page: () => RegisterScreenSteepOne(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.registerLoginRoute,
      page: () => RegisterScreenSteepTwo(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => const HomeScreen(),
      bindings: [
        TransactionBinding(),
      ],
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.profileRoute,
      page: () => const UserProfileScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.newTransactionRoute,
      page: () => NewTransactionScreenStepOne(),
      transition: Transition.cupertino,
    ),
  ];
}

abstract class AppRoutes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerNameRoute = '/register';
  static const String registerLoginRoute = '/registerLogin';
  static const String homeRoute = '/home';
  static const String profileRoute = '/profile';
  static const String newTransactionRoute = '/newTransaction';
}
