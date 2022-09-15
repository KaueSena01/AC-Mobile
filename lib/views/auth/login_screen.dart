import 'package:balanced/common/input_widget.dart';
import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {  

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                            height: 220,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 1,
                        child: ClipPath(
                          clipper: WaveClipper(),
                          child: Container(
                            color: primaryColor,
                            height: 200,
                          ),
                        ),
                      ), 
                      Positioned(
                        top: 160,
                        left: 20,
                        child: Column(
                          children: const [
                            Text(
                              'Seja\nbem vindo a', 
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800
                              )
                            ),
                            Text(
                              'BALANCED!', 
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800
                              )
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 5,
                        bottom: 75,
                        child:
                        Image.asset(
                          'assets/images/logo_transparent.png',
                          height: 100,
                        )  
                      )
                    ], 
                  ), 
                  const SizedBox(height: 75),
                  const InputWidget(
                    label: 'Login:', 
                    icon: Icons.email,
                    placeholder: 'email@exemplo.com',
                  ),
                  const InputWidget(
                    label: 'Senha:', 
                    icon: Icons.lock,
                    suffixIcon: true,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch, 
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),      
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ), 
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ), 
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
        ],
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