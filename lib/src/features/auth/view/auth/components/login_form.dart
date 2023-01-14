import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';

typedef StringCallback = void Function(String val);

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size15, horizontal: size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(size00, size20, size00, size10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bem-vindo de volta!",
                  style: AppTheme.lightText.displayMedium!.apply(
                    color: whiteColor,
                  ),
                ),
                Text(
                  "Entre com seu e-mail e senha",
                  style: AppTheme.lightText.labelMedium!.apply(
                    color: labelColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: size20),
          InputTextWidget(
            label: "E-mail",
            textInputType: TextInputType.emailAddress,
            controller: emailController,
            validator: validateEmail,
          ),
          const SizedBox(height: size40),
          InputTextWidget(
            label: "Senha",
            textInputType: TextInputType.visiblePassword,
            controller: passwordController,
            validator: validatePassword,
          ),
        ],
      ),
    );
  }
}
