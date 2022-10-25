import 'package:atlas_coins/common/divider_widget.dart';
import 'package:atlas_coins/common/input_widget.dart';
import 'package:atlas_coins/common/outiline_button_widget.dart';
import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);

  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {  

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container( 
                      margin: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Bem vindo a', style: TextStyle(
                            color: Colors.white,  
                            fontSize: 28,
                            fontWeight: FontWeight.w500
                            )
                          ),
                          Text('ATLAS COINS', style: TextStyle(
                            color: secondaryColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w900
                            ) 
                          ),
                        ],
                      )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 25, 10, 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputWidget(
                            label: 'E-mail:', 
                            placeholder: 'Digite seu e-mail',
                            icon: Icons.email,
                            controller: emailController,
                          ),
                          InputWidget(
                            label: 'Senha:', 
                            placeholder: 'Digite sua senha',
                            icon: Icons.lock,
                            suffixIcon: true,
                            controller: passwordController,
                          ),
                        Container(
                        margin: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              onPressed: authController.loading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();

                                      if (_key.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;
                                        authController.login(
                                            email: email, password: password);
                                      }
                                    },
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ), 
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const DividerWidget(),
                      const OutilineuttonWidget(
                        label: 'Criar conta'
                      )],
                      ),
                    ),
                  ),
                ] 
              ),
              Positioned(
                top: 10,
                left: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}