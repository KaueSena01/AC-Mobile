import 'package:balanced/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  final bool suffixIcon;
  final String? placeholder;

  const InputWidget({ 
    Key? key ,
    required this.label, 
    required this.icon,
    this.placeholder, 
    this.suffixIcon = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label, 
            style: const TextStyle(
              color: darkColor,
              fontSize: 16
            )
          ),
          const SizedBox(height: 5),
          TextFormField( 
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(icon, size: 20, color: primaryColor), 
              suffixIcon: suffixIcon 
              ? IconButton(
                onPressed: () {}, 
                icon: const Icon(
                  Icons.visibility, 
                  color: primaryColor,
                  size: 25
                )
              )  
              : null,
              hintText: placeholder,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: darkColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12)
              ), 
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12)
              )
            ),
          )
        ],
      ),
    );
  }
}