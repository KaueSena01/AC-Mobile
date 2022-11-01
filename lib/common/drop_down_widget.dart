import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_theme.dart';

const List<String> list = <String>['Depósito', 'Despesa'];

class DropDownWidget extends StatefulWidget {
  final String label;

  const DropDownWidget({ 
    Key? key,
    required this.label
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String dropdownValue = list.first;
  final TransactionController transactionController = TransactionController();

  @override
  Widget build(BuildContext context) { 
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label, 
            style: const TextStyle(
              color: darkColor,
              fontSize: 16
            )
          ),
          const SizedBox(height: 3),
          GetBuilder<TransactionController>(
            builder: (_) {
              return SizedBox( 
            height: 50,
            child: DropdownButtonFormField(
              style: const TextStyle(fontSize: 16, color: darkColor, backgroundColor: Colors.transparent),
              value: dropdownValue,
              isExpanded: true,
              elevation: 0,
              isDense: true, 
              onChanged: (String? value) { 
                setState(() {
                  dropdownValue = value!;
                  _.setTransactionType(value);
                });
              },
              decoration: InputDecoration(
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
                ),
              ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          );
            }
          ) 
        ],
      ),
    );
  }
}