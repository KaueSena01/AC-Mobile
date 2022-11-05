import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/services/utils/static_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/colors_theme.dart';

const List<String> list = <String>[TransactionType.deposit, TransactionType.expense];

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
              fontSize: 18
            )
          ),
          GetBuilder<TransactionController>(
            builder: (_) {
              return SizedBox( 
              height: 50,
              child: DropdownButtonFormField(
                style: const TextStyle(color: Colors.black, fontSize: 16, backgroundColor: Colors.transparent),
                value: dropdownValue,
                dropdownColor: mainGreyColor,
                isExpanded: true,
                elevation: 0,
                isDense: true, 
                onChanged: (String? value) { 
                  setState(() {
                    dropdownValue = value!;
                    _.setTransactionType(value);
                  });
                },
                decoration: const InputDecoration(
                  isDense: false,
                  hintStyle: TextStyle(color: mainDarkColor, fontSize: 16),
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainDarkColor, width: 2)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainDarkColor, width: 2)
                  )
                ),
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value));
                  }).toList()
                ),
              );
            }
          ) 
        ],
      ),
    );
  }
}