import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget { 
  
  final TransactionModel? transactionList;
  final UtilsServices utilsServices = UtilsServices();

  Transaction({ 
    Key? key,
    required this.transactionList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 45.0,
                height: 45.0,
                decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle)
              ),
              Positioned(
                top: 18,
                left: 11,
                child: Column(
                  children: [
                    Text(utilsServices.dayFormater(transactionList!.date!), style: const TextStyle(
                      color: ligthColor,  
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                      )
                    ),
                    Text(utilsServices.monthFormater(transactionList!.date!), style: const TextStyle(
                      color: ligthColor,  
                      fontSize: 13,
                      fontWeight: FontWeight.w500
                      )
                    )
                  ],
                ),
              ) 
            ],
          ),
          Expanded(
            child: Stack(
              children: [
                Card(
                  elevation: 0,
                  color: greyColor,
                  margin: const EdgeInsets.only(left: 15),
                  child: ExpansionTile(
                    initiallyExpanded: false,
                    iconColor: primaryColor,
                    collapsedIconColor: primaryColor,
                    title: Text(transactionList!.title!, style: const TextStyle(
                      color: primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600)
                    ),
                    children: [
                      ListTile(
                        title: Text(transactionList!.description!)
                      ),
                      ListTile(
                        title: Text(transactionList!.date!),
                      )
                    ],
                    subtitle: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          color: transactionList!.type! == 1 ? depositColor : expenseColor
                        ),
                        children: [
                          TextSpan(
                            text: transactionList!.type! == 1 ? 'Depósito: ' : 'Despesa: ', 
                            style: const TextStyle(
                            fontWeight: FontWeight.w500
                          )),
                          TextSpan(text: utilsServices.transactionValue(transactionList!.value!)),
                        ]
                      )
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 10,
                  child: Image.asset(
                    transactionList!.type! == 1 ?
                    'assets/icons/deposit.png' :
                    'assets/icons/expense.png',
                    width: 12,
                    height: 12,
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}