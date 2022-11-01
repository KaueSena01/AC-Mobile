import 'package:atlas_coins/common/input_widget.dart';
import 'package:atlas_coins/controllers/auth_controller.dart';
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
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text("ATLAS COINS",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        )),
                    const Text(
                        "Controle de carteira e organização do seu dinheiro!",
                        style: TextStyle(
                            color: darkColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(height: 40),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputWidget(
                            label: "Nome:",
                            placeholder: "Ex: Conta de água",
                            icon: Icons.person,
                            initialValue: authController.auth.user!.name,
                            readOnly: true,
                          ),
                          InputWidget(
                            label: "E-mail:",
                            placeholder: "Ex: Conta de água",
                            icon: Icons.email,
                            initialValue: authController.auth.user!.email,
                            readOnly: true,
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: updatePassword,
                            child: const Text("Alterar senha",
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
              Positioned(
                  top: 0,
                  right: 0,
                  child: SafeArea(
                    child: Image.asset(
                      "assets/icons/background.png",
                      height: 100,
                      width: 100,
                    ),
                  )),
              Positioned(
                top: 15,
                left: 15,
                child: SafeArea(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: ligthColor,
                      ),
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

    final _key = GlobalKey<FormState>();

    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              reverse: true,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputWidget(
                            label: "Senha atual:",
                            placeholder: "Digite a senha atual",
                            icon: Icons.lock,
                            controller: currentPasswordController,
                          ),
                          InputWidget(
                            label: "Nova senha:",
                            placeholder: "Digite a nova senha",
                            icon: Icons.lock,
                            controller: newPasswordController,
                          ),
                          InputWidget(
                            label: "Confirmar senha:",
                            placeholder: "Repita a nova senha",
                            icon: Icons.lock,
                            controller: newPasswordConfirmationController,
                          ),
                          const SizedBox(height: 15),
                          GetX<AuthController>( 
                            builder: (controller) {
                              return 
                              Container(
                                margin: const EdgeInsets.only(top: 40),
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: controller.loading.value ? null : () {
                                  FocusScope.of(context).unfocus();

                                  if (_key.currentState!.validate()) {
                                    final String password = newPasswordController.text;
                                    controller.updatePassword(newPassword: password);
                                  }
                                },
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text(
                                    'Salvar',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      right: 5,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.close),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
