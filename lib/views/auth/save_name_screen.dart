import 'package:atlas_coins/common/button_widget.dart';
import 'package:atlas_coins/common/input_text_widget.dart';
import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/services/utils/validators.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding/onboarding_screen.dart';

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
                  padding: const EdgeInsets.fromLTRB(15, 125, 15, 0),
                  child: Form(
                    key:  _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text("Olá, para começar precisamos\nque informe seu nome.", style: TextStyle(
                                color: darkColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                              )),
                              const SizedBox(height: 20), 
                              InputTextWidget(
                                placeholder: "Nome",
                                controller: nameController,
                                validator: validateName,
                              )
                            ],
                          ),
                        ),
                        ButtonWidget(
                          label: "Continuar", 
                          onPressed: () {
                            if(_formKey.currentState!.validate()) {
                              authController.saveName(nameController.text);
                            } 
                          }
                        ),
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
                        Get.to(const OnboardingScreen());
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