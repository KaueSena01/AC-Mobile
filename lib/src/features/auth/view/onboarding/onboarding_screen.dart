import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Container(
              margin: const EdgeInsets.all(size20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(size25),
                    child: Text(
                      "Manage PAY",
                      style: AppTheme.lightText.titleMedium!.apply(
                        color: whiteColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/onboarding_image.png",
                          height: size200,
                          width: size200,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: size40, bottom: size20),
                          child: Text(
                            "Gerencie suas\nfinanças corretamente",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              color: whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            size20,
                            size00,
                            size20,
                            size20,
                          ),
                          child: Text(
                            "A Manage PAY é uma plataforma onde a administração de transações é o foco principal, oferecendo a melhor experiência para seus usuários.",
                            style: AppTheme.lightText.headlineSmall!.apply(
                              color: labelColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          child: Container(
                            height: size50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: labelColor, width: 2),
                              borderRadius: BorderRadius.circular(size30),
                            ),
                            child: Text(
                              ButtonLabel.logIn,
                              style: AppTheme.lightText.headlineMedium!.apply(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          onTap: () => Get.toNamed(AppRoutes.loginRoute),
                        ),
                      ),
                      const SizedBox(width: size20),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          child: Container(
                            height: size50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(size30),
                            ),
                            child: Text(
                              ButtonLabel.createAccount,
                              style: AppTheme.lightText.headlineMedium!.apply(
                                color: whiteColor,
                              ),
                            ),
                          ),
                          onTap: () => Get.toNamed(AppRoutes.registerNameRoute),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
