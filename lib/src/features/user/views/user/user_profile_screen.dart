import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/features/user/controller/auth_controller.dart';
import 'package:atlas_coins/src/features/user/views/user/components/user_details.dart';
import 'package:atlas_coins/src/features/user/views/user/components/user_options.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';
import 'package:atlas_coins/src/components/outiline_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Hero(
            tag: "Hero",
            child: Column(
              children: [
                AppBarApp(
                  onPressed: () => Get.back(),
                  title: "Perfil",
                ),
                UserDetails(authController: authController),
                const UserOptions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final newPasswordConfirmationController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(size10)),
          insetPadding: const EdgeInsets.all(size20),
          child: SingleChildScrollView(
            reverse: true,
            child: Container(
              margin: const EdgeInsets.all(size20),
              width: MediaQuery.of(context).size.width - size30,
              height: MediaQuery.of(context).size.height - size120,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Alterar senha",
                      style: AppTheme.lightText.displayMedium!.apply(
                        color: primaryColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: tertiaryColor,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InputTextWidget(
                            label: "Senha atual:",
                            placeholder: "Sua senha atual",
                            controller: currentPasswordController,
                            validator: validatePassword,
                          ),
                          const SizedBox(height: size25),
                          InputTextWidget(
                            label: "Nova senha:",
                            placeholder: "Sua nova senha",
                            controller: newPasswordController,
                            validator: validateNewPassword,
                          ),
                          const SizedBox(height: size25),
                          InputTextWidget(
                            label: "Confirmar senha:",
                            placeholder: "Confirme sua nova senha",
                            controller: newPasswordConfirmationController,
                            validator: validatePasswordConfirmation,
                          ),
                        ],
                      ),
                    ),
                    GetX<AuthController>(
                      builder: (controller) {
                        return ButtonWidget(
                          label: ButtonLabel.save,
                          onPressed: controller.loading.value
                              ? null
                              : () {
                                  FocusScope.of(context).unfocus();

                                  if (_formKey.currentState!.validate()) {
                                    controller.updatePassword(
                                        newPassword:
                                            newPasswordController.text);
                                  }
                                },
                        );
                      },
                    ),
                    const SizedBox(height: size20),
                    OutilineButtonWidget(
                      label: ButtonLabel.cancel,
                      color: primaryColor,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
