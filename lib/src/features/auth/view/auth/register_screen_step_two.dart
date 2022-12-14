import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/auth/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/auth/view/auth/components/register_form_step_two.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenSteepTwo extends StatelessWidget {
  RegisterScreenSteepTwo({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  dynamic arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Form(
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
              Container(
                margin: const EdgeInsets.all(size20),
                child: ButtonWidget(
                  label: "Finalizar",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.register(
                        name: arguments[0]['Name'],
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
