import 'package:atlas_coins/src/features/user/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/user/views/auth/save_name_screen.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/widgets/arrow_back_widget.dart';
import 'package:atlas_coins/src/widgets/button_widget.dart';
import 'package:atlas_coins/src/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveEmailAndPasswordScreen extends StatelessWidget {
  SaveEmailAndPasswordScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  dynamic getName = Get.arguments;

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
                                  style: AppTheme.lightText.displaySmall!.apply(
                                    color: primaryDarkColor,
                                  ),
                                  children: [
                                    const TextSpan(text: "Olá "),
                                    TextSpan(
                                      text: getName[0]['Name'],
                                      style:
                                          AppTheme.lightText.bodyLarge!.apply(
                                        color: primaryDarkColor,
                                      ),
                                    ),
                                    const TextSpan(
                                        text: "! Qual o seu e-mail?"),
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
                              Text(
                                "Agora, crie uma senha",
                                style: AppTheme.lightText.displaySmall!.apply(
                                  color: primaryDarkColor,
                                ),
                              ),
                              const SizedBox(height: 20),
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
                              label: ButtonLabel.finalize,
                              onPressed: controller.loading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        controller.register(
                                            name: getName[0]['Name'],
                                            email: emailController.text,
                                            password: passwordController.text);
                                      }
                                    },
                            );
                          },
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                ArrowBackWidget(
                  onPressed: () => Get.to(SaveNameScreen()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
