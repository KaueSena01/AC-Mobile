import 'package:atlas_coins/common/button_widget.dart';
import 'package:atlas_coins/common/outiline_button_widget.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:atlas_coins/views/auth/login_screen.dart';
import 'package:atlas_coins/views/auth/save_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background 1.png", 
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            bottom: 30,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/logo_start.png",
                    height: 120,
                    width: 120,
                  ),
                  const Text(
                    "Muitos gastos desnecessários são\n evitados ao fazer uma simples\n análise.",
                    style: TextStyle(
                      color: ligthColor, 
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(height: 50),
                  ButtonWidget(
                    label: "Entrar na minha conta",
                    onPressed: () { Get.to(LoginScreen()); },
                  ),
                  const SizedBox(height: 15),
                  OutilineuttonWidget(
                    label: "Não tenho conta",
                    onPressed: () { Get.to(SaveNameScreen()); },
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}