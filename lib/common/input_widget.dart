import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {

  final String label;
  final IconData icon;
  final bool suffixIcon;
  final bool? isDate;
  final bool? isDescription;
  final String? placeholder;
  final TextEditingController? controller;

  const InputWidget({ 
    Key? key,
    required this.label, 
    required this.icon,
    this.placeholder, 
    this.suffixIcon = false,
    this.isDate = false,
    this.isDescription = false,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
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
          SizedBox(
            height: !isDescription! ? 50 : null,
            child: TextFormField( 
              inputFormatters: isDate! 
              ? [ 
                FilteringTextInputFormatter.digitsOnly,
                DataInputFormatter(),
              ] : null,
              minLines: isDescription! ? 4 : null, 
              maxLines: isDescription! ? 6 : null, 
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: !isDescription! ? Icon(icon, size: 18) : null, 
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
            ),
          )
        ],
      ),
    );
  }
}