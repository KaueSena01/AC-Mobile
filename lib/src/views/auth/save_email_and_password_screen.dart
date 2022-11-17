import 'package:atlas_coins/src/common/button_widget.dart';
import 'package:atlas_coins/src/common/input_text_widget.dart';
import 'package:atlas_coins/src/controllers/auth_controller.dart';
import 'package:atlas_coins/src/services/utils/static_values.dart';
import 'package:atlas_coins/src/services/utils/validators.dart';
import 'package:atlas_coins/src/theme/colors_theme.dart';
import 'package:atlas_coins/src/views/auth/save_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveEmailAndPasswordScreen extends StatelessWidget {
  SaveEmailAndPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Hero(
        tag: 'Register email and password',
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 125, 15, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                    color: darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  const TextSpan(text: "Olá "),
                                  TextSpan(
                                      text: authController.userName.value,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  const TextSpan(text: "! Qual o seu e-mail?"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            InputTextWidget(
                              placeholder: "Seu e-mail",
                              controller: emailController,
                              validator: validateEmail,
                            ),
                            const SizedBox(height: 70),
                            const Text("Agora, crie uma senha",
                                style: TextStyle(
                                    color: darkColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400)),
                            const SizedBox(height: 20),
                            InputTextWidget(
                              placeholder: "Sua senha",
                              controller: passwordController,
                              validator: validatePassword,
                            ),
                          ],
                        )),
                        GetX<AuthController>(builder: (controller) {
                          return ButtonWidget(
                              label: ButtonLabel.finalize,
                              onPressed: controller.loading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.register(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    });
                        }),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Get.to(SaveNameScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: darkColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
