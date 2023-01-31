import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';

class Fingerprint extends StatelessWidget {
  Fingerprint({Key? key}) : super(key: key);

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    authController.checkBiometricController();
    return BaseStructure(
      child: Container(
        margin: const EdgeInsets.all(size30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: size60, bottom: size10),
                      height: size170,
                      width: size170,
                      child: Image.asset("assets/images/fingerprint.png"),
                    ),
                    Text(
                      "Use sua digital para\ncontinuar",
                      style: AppTheme.lightText.displayMedium!.apply(
                        color: whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            GetX<AuthController>(
              builder: (controller) {
                return ButtonWidget(
                  margin: const EdgeInsets.only(bottom: size30),
                  label: ButtonLabel.useFingerprint,
                  circularIndicator: controller.loading.value ? true : false,
                  backgroundColor:
                      controller.loading.value ? defaultColor : primaryColor,
                  onPressed: controller.loading.value
                      ? null
                      : () => controller.checkBiometricController(),
                );
              },
            ),
            GestureDetector(
              child: Text(
                ButtonLabel.logInWithoutFingerprint,
                style: AppTheme.lightText.labelMedium!.apply(
                  color: whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () => Get.toNamed(AppRoutes.loginRoute),
            )
          ],
        ),
      ),
    );
  }
}
