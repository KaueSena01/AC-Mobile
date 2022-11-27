import 'package:atlas_coins/src/features/user/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/user/views/onboarding/onboarding_screen.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/widgets/arrow_back_widget.dart';
import 'package:atlas_coins/src/widgets/button_widget.dart';
import 'package:atlas_coins/src/widgets/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveNameScreen extends StatelessWidget {
  SaveNameScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final AuthController authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Hero(
            tag: 'Register',
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                      defPadding, size120, defPadding, size00),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Olá, para começar precisamos\nque informe seu nome e sobrenome.",
                                style: AppTheme.lightText.displaySmall!.apply(
                                  color: primaryDarkColor,
                                ),
                              ),
                              const SizedBox(height: maxPadding),
                              InputTextWidget(
                                placeholder: "Nome",
                                controller: nameController,
                                validator: validateName,
                              ),
                            ],
                          ),
                        ),
                        ButtonWidget(
                          label: ButtonLabel.next,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authController.saveName(nameController.text);
                            }
                          },
                        ),
                        const SizedBox(height: size20),
                      ],
                    ),
                  ),
                ),
                ArrowBackWidget(
                  onPressed: () => Get.to(const OnboardingScreen()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
