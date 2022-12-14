import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/auth/view/auth/login_screen.dart';
import 'package:atlas_coins/src/features/auth/view/auth/register_screen_step_one.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';
import 'package:atlas_coins/src/components/outiline_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          margin: const EdgeInsets.all(size20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppInformation.appLogoMini,
                      height: size70,
                      width: size70,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(
                          size30, size30, size30, size80),
                      child: Text(
                        "A PAYEMENT ORG é uma plataforma onde a administração de transações é o nosso foco principal, com um Desing novo e moderno para forneçer a melhor experiência possível para nossos clientes.",
                        style: AppTheme.lightText.displaySmall!.apply(
                          color: labelColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: const EdgeInsets.symmetric(vertical: size20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonWidget(
                      label: "Entrar",
                      backgroundColor: primaryColor,
                      onPressed: () => Get.to(LoginScreen()),
                    ),
                    const SizedBox(height: size20),
                    GestureDetector(
                      onTap: () => Get.to(() => RegisterScreenSteepOne()),
                      child: Text(
                        "Criar uma conta",
                        style: AppTheme.lightText.headlineSmall!.apply(
                          color: labelColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // body: Stack(
        //   children: [
        //     Container(
        //       margin: const EdgeInsets.all(0),
        //       padding: const EdgeInsets.all(0),
        //       height: MediaQuery.of(context).size.height,
        //       width: MediaQuery.of(context).size.width,
        //       child: Image.asset(
        //         AppInformation.backgroundAppPath,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     Positioned(
        //       bottom: 30,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(horizontal: defPadding),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Image.asset(AppInformation.appLogoSecondaryPath,
        //                 height: size120, width: size120),
        //             Text(
        //               "Muitos gastos desnecessários são\n evitados ao fazer uma simples\n análise.",
        //               style: AppTheme.lightText.labelMedium?.apply(
        //                 color: tertiaryColor,
        //               ),
        //             ),
        //             const SizedBox(height: size50),
        //             ButtonWidget(
        //               label: ButtonLabel.logInAccount,
        //               onPressed: () => {login(context)},
        //             ),
        //             const SizedBox(height: size15),
        //             OutilineButtonWidget(
        //               label: ButtonLabel.noHaveAccount,
        //               onPressed: () {
        //                 Get.to(SaveNameScreen());
        //               },
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Future<bool?> login(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(minPadding),
          ),
          insetPadding: const EdgeInsets.all(defPadding),
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              margin: const EdgeInsets.all(maxPadding),
              width: MediaQuery.of(context).size.width - size30,
              height: MediaQuery.of(context).size.height - size120,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: AppTheme.lightText.titleLarge!.apply(
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 70,
                      ),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: tertiaryColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "E-mail:",
                            style: AppTheme.lightText.displaySmall!.apply(
                              color: tertiaryColor,
                            ),
                          ),
                          InputTextWidget(
                            placeholder: "Seu e-mail",
                            controller: emailController,
                            validator: validateEmail,
                          ),
                          const SizedBox(height: size40),
                          Text(
                            "Senha:",
                            style: AppTheme.lightText.displaySmall!.apply(
                              color: tertiaryColor,
                            ),
                          ),
                          InputTextWidget(
                            placeholder: "Sua senha",
                            controller: passwordController,
                            validator: validatePassword,
                          ),
                        ],
                      ),
                    ),
                    GetX<AuthController>(
                      builder: (controller) {
                        return ButtonWidget(
                          label: ButtonLabel.logIn,
                          onPressed: controller.loading.value
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();

                                  if (_formKey.currentState!.validate()) {
                                    controller.login(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                        );
                      },
                    ),
                    const SizedBox(height: size20),
                    OutilineButtonWidget(
                      label: ButtonLabel.cancel,
                      color: primaryColor,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
