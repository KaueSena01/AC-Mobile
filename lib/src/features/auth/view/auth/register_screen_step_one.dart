import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/features/auth/view/auth/components/register_form_step_one.dart';

class RegisterScreenSteepOne extends StatelessWidget {
  RegisterScreenSteepOne({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RxBool enabledButton = false.obs;

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      child: Form(
        key: _formKey,
        onChanged: () {
          enabledButton.value = _formKey.currentState!.validate();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarApp(
              onPressed: () {},
              title: "Criação de usuário",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: RegisterFormStepOne(
                  nameController: nameController,
                ),
              ),
            ),
            Obx(
              () => ButtonWidget(
                margin: const EdgeInsets.all(size20),
                label: "Continuar",
                onPressed: !enabledButton.value
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          Get.toNamed(
                            AppRoutes.registerLoginRoute,
                            arguments: [
                              {"Name": nameController.text},
                            ],
                          );
                        }
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
