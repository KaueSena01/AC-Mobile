import 'package:atlas_coins/common/button_widget.dart';
import 'package:atlas_coins/common/divider_widget.dart';
import 'package:atlas_coins/common/input_widget.dart';
import 'package:atlas_coins/common/outiline_button_widget.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

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
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 30, bottom: 25),
                      child: const Text.rich(
                        TextSpan(
                          
                          children: [
                            TextSpan(text: 'Bem vindo a\n', style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500
                            )),
                            TextSpan(text: 'atlas_coins', style: TextStyle(
                              color: secondaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                            )),
                            TextSpan(text: '!', style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700
                            )),
                          ]
                        )
                      )
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        InputWidget(
                          label: 'E-mail:', 
                          placeholder: 'Digite seu e-mail',
                          icon: Icons.email
                        ),
                        InputWidget(
                          label: 'Senha:', 
                          placeholder: 'Digite sua senha',
                          icon: Icons.lock,
                          suffixIcon: true,
                        ),
                        ButtonWidget(
                          label: 'Entrar'
                        ),
                        DividerWidget(),
                        OutilineuttonWidget(
                          label: 'Criar conta'
                        )
                      ],
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
              Positioned(
                top: 10,
                right: 10,
                child: SafeArea(
                  child: Image.asset(
                    'assets/images/logo_transparent.png',
                    height: 100,
                  )
                ),
              ),
            ],
          )
        )
      )
    );
  }
}