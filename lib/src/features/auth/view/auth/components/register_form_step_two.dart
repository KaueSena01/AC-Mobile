import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';

class RegisterFormStepTwo extends StatelessWidget {
  const RegisterFormStepTwo({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.argumentData,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final dynamic argumentData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size15, horizontal: size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
              size00,
              size20,
              size00,
              size10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    style: AppTheme.lightText.displayMedium!.apply(
                      color: whiteColor,
                    ),
                    children: [
                      const TextSpan(text: "Olá "),
                      TextSpan(
                        text: argumentData,
                        // text: "Kauê",
                        style: AppTheme.lightText.bodyLarge!.apply(
                          color: whiteColor,
                        ),
                      ),
                      const TextSpan(text: "! qual o seu e-mail?"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: size10),
          InputTextWidget(
            label: "Seu e-mail",
            textInputType: TextInputType.emailAddress,
            controller: emailController,
            validator: validateEmail,
          ),
          const SizedBox(height: size40),
          Text(
            "Agora, crie sua senha",
            style: AppTheme.lightText.displayMedium!.apply(
              color: whiteColor,
            ),
          ),
          const SizedBox(height: size15),
          InputTextWidget(
            label: "Sua senha",
            textInputType: TextInputType.visiblePassword,
            controller: passwordController,
            validator: validatePassword,
          ),
        ],
      ),
    );
  }
}
