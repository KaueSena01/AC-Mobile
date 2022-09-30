import 'package:atlas_coins/theme/colors_theme.dart';
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
          const SizedBox(height: 3),
          TextFormField( 
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: Icon(icon, size: 18), 
              suffixIcon: suffixIcon 
              ? IconButton(
                onPressed: () {}, 
                icon: const Icon(
                  Icons.visibility, 
                  size: 18
                )
              )  
              : null,
              hintText: placeholder,
              labelStyle: const TextStyle(
                color: Colors.red,
                fontSize: 30
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: darkColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12)
              ), 
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: darkColor,
                  width: 1,
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