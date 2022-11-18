import 'package:atlas_coins/src/common/button_widget.dart';
import 'package:atlas_coins/src/common/input_text_widget.dart';
import 'package:atlas_coins/src/common/outiline_button_widget.dart';
import 'package:atlas_coins/src/controllers/auth_controller.dart';
import 'package:atlas_coins/src/services/utils/static_values.dart';
import 'package:atlas_coins/src/services/utils/validators.dart';
import 'package:atlas_coins/src/theme/colors_theme.dart';
import 'package:atlas_coins/src/views/auth/save_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              AppInformation.backgroundAppPath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
          bottom: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppInformation.appLogoSecondaryPath,
                  height: 120,
                  width: 120,
                ),
                const Text(
                  "Muitos gastos desnecessários são\n evitados ao fazer uma simples\n análise.",
                  style: TextStyle(
                    color: ligthColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(height: 50),
                ButtonWidget(
                  label: ButtonLabel.logInAccount,
                  onPressed: () => {login(context)},
                ),
                const SizedBox(height: 15),
                OutilineButtonWidget(
                  label: ButtonLabel.noHaveAccount,
                  onPressed: () {
                    Get.to(SaveNameScreen());
                  },
                )
              ],
            ),
          ))
        ],
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
            borderRadius: BorderRadius.circular(10)),
          insetPadding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height - 125,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 70),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: mainDarkColor
                      ),
                    ),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text("E-mail:",
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          )
                        ),
                        InputTextWidget(
                          placeholder: "Seu e-mail",
                          controller: emailController,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 40),
                        const Text("Senha:",
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                          )
                        ),
                        InputTextWidget(
                          placeholder: "Sua senha",
                          controller: passwordController,
                          validator: validatePassword,
                        ),
                      ],
                    )),
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
                                password: passwordController.text
                              ); 
                            }
                          }
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    OutilineButtonWidget(
                      label: ButtonLabel.cancel,
                      color: primaryColor,
                      onPressed: () { Get.back(); }
                    )
                  ],
                ),
              ),
            ),
          )
        );
      }
    );
  }
}