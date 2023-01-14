import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';

const List<String> transactionType = <String>[
  TransactionType.deposit,
  TransactionType.expense
];

const List<String> payment = <String>[
  "Dinheiro",
  "PIX",
  "Cartão",
  "Agência",
];

class DropDownWidget extends StatefulWidget {
  final String label;
  final bool isPaymentOptions;

  const DropDownWidget({
    Key? key,
    required this.label,
    this.isPaymentOptions = false,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = transactionType.first;
  final TransactionController transactionController = TransactionController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String dropdownValue =
        widget.isPaymentOptions ? payment.first : transactionType.first;
    return GetBuilder<TransactionController>(builder: (_) {
      return Container(
        padding: const EdgeInsets.fromLTRB(20, size30, 30, 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: const TextStyle(color: primaryColor, fontSize: 15),
            ),
            SizedBox(
              height: size45,
              width: size.width,
              child: DropdownButtonFormField(
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 15,
                ),
                value: dropdownValue,
                dropdownColor: cardBackgroundColor,
                elevation: 0,
                onChanged: (String? value) {
                  setState(
                    () {
                      dropdownValue = value!;
                      _.setTransactionType(
                        value,
                        widget.isPaymentOptions
                            ? DropDownType.paymentOptions
                            : DropDownType.transactionType,
                      );
                    },
                  );
                },
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: primaryColor, fontSize: 16),
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                ),
                items: widget.isPaymentOptions
                    ? payment.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList()
                    : transactionType.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}
