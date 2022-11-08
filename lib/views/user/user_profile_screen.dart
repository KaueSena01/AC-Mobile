import 'package:atlas_coins/common/button_widget.dart';
import 'package:atlas_coins/common/input_text_widget.dart';
import 'package:atlas_coins/common/outiline_button_widget.dart';
import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/services/utils/static_values.dart';
import 'package:atlas_coins/services/utils/validators.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final authController = Get.find<AuthController>();

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(AppInformation.appNameUpperCase,
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      )
                    ),
                    const Text("Planejar cenários futuros e calcular riscos  aumentara a taxa de crescimento do capital investido!", style: TextStyle(
                      color: darkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                      )
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputTextWidget( 
                            label: "Nome:",
                            hint: true,
                            readOnly: true,
                            initialValue: authController.auth.user!.name,
                          ),
                          const SizedBox(height: 30),
                          InputTextWidget( 
                            label: "E-mail:",
                            hint: true,
                            readOnly: true,
                            initialValue: authController.auth.user!.email,
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: updatePassword,
                            child: const Text("Alterar senha",
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Get.back();
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
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 30,
              height: MediaQuery.of(context).size.height - 125,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Alterar senha",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 3,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: mainDarkColor
                      ),
                    ),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputTextWidget(
                          hint: true,
                          label: "Senha atual:",
                          placeholder: "Sua senha atual",  
                          controller: currentPasswordController,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 25),
                        InputTextWidget(
                          hint: true,
                          label: "Nova senha:",
                          placeholder: "Sua nova senha", 
                          controller: newPasswordController,
                          validator: validateNewPassword,
                        ),
                        const SizedBox(height: 25),
                        InputTextWidget(
                          hint: true,
                          label: "Confirmar senha:",
                          placeholder: "Confirme sua nova senha", 
                          controller: newPasswordConfirmationController,
                          validator: validatePasswordConfirmation,
                        ),
                      ],
                    )),
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
                                newPassword: newPasswordController.text
                              );
                            }
                          }
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    OutilineButtonWidget(
                      label: ButtonLabel.cancel,
                      color: primaryColor,
                      onPressed: () { Get.back(); }
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
