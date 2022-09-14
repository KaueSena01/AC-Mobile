import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: Column(
          children: [
            Stack(
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
                  right: 5,
                  bottom: 60,
                  child:
                  Image.asset(
                    'assets/images/logo_transparent.png',
                    height: 125,
                  )  
                )
              ], 
            ),
            
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