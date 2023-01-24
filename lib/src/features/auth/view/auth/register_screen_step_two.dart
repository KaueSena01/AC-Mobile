import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/auth/view/auth/components/register_form_step_two.dart';

class RegisterScreenSteepTwo extends StatelessWidget {
  RegisterScreenSteepTwo({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarApp(
              onPressed: () {},
              title: "Criação de usuário",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: RegisterFormStepTwo(
                  emailController: emailController,
                  passwordController: passwordController,
                  argumentData: arguments[0]['Name'],
                ),
              ),
            ),
            GetX<AuthController>(
              builder: (authController) {
                return ButtonWidget(
                  margin: const EdgeInsets.all(size20),
                  label: "Finalizar",
                  circularIndicator:
                      authController.loading.value ? true : false,
                  backgroundColor: authController.loading.value
                      ? defaultColor
                      : primaryColor,
                  onPressed: authController.loading.value
                      ? null
                      : () {
                          FocusScope.of(context).unfocus();

                          if (_formKey.currentState!.validate()) {
                            authController.signUpController(
                              name: arguments[0]['Name'],
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
