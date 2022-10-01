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
            ],
          )
        )
      )
    );
  }
}