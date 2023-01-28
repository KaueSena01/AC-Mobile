import 'package:flutter/material.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';

class RegisterFormStepOne extends StatelessWidget {
  const RegisterFormStepOne({
    Key? key,
    required this.nameController,
  }) : super(key: key);

  final TextEditingController nameController;

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
                  "Olá, para começar precisamos que informe seu nome",
                  style: AppTheme.lightText.displayMedium!.apply(
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: size20),
          InputTextWidget(
            label: "Seu nome",
            placeholder: "Digite seu nome",
            textInputType: TextInputType.name,
            controller: nameController,
            validator: validateName,
          ),
        ],
      ),
    );
  }
}
