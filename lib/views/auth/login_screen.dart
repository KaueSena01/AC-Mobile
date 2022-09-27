import 'package:balanced/common/button_widget.dart';
import 'package:balanced/common/divider_widget.dart';
import 'package:balanced/common/input_widget.dart';
import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Opacity(
                  opacity: 1,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: secondaryColor,
                      height: 180,
                    ),
                  ),
                ),
                Opacity(
                  opacity: 1,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(
                      color: primaryColor,
                      height: 170,
                    ),
                  ),
                ), 
                Positioned(
                  top: 120,
                  left: 20,
                  child: Column(
                    children: const [
                      Text(
                        'Seja\nBem vindo a', 
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800
                        )
                      ),
                      Text(
                        'BALANCED!', 
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 32,
                          fontWeight: FontWeight.w800
                        )
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 45,
                  child:
                  Image.asset(
                    'assets/images/logo_transparent.png',
                    height: 100,
                  )  
                )
              ], 
            ), 
            const SizedBox(height: 80),
            const InputWidget(
              label: 'Login:', 
              icon: Icons.email,
              placeholder: 'email@exemplo.com',
            ),
            const InputWidget(
              label: 'Senha:', 
              icon: Icons.lock,
              suffixIcon: true,
            ),
            const ButtonWidget(
              label: 'Entrar'
            ),
            const DividerWidget(),
            const InkWell(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar conta',
                  style: TextStyle(
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    
      var path = Path();
      path.lineTo(0, size.height); 

      var secondEnd = Offset(size.width - (size.width) - 100, size.height - 200);

      var secondStart = Offset(size.width, size.height);  

      path.quadraticBezierTo(secondEnd.dx, secondEnd.dy, secondStart.dx, secondStart.dy);

      path.lineTo(size.width, 0);  
      path.close();
      return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
     return false; 
  }
}