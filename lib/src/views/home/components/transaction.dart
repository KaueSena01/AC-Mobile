import 'package:atlas_coins/src/models/transaction_model.dart';
import 'package:atlas_coins/src/services/utils/static_values.dart';
import 'package:atlas_coins/src/services/utils/utils_services.dart';
import 'package:atlas_coins/src/theme/colors_theme.dart';
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
    return  Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
              ),
              child: Stack(
                children: [
                  Card(
                    color: Colors.white,
                    elevation: 0,
                    margin: const EdgeInsets.all(0),
                    child: ClipPath(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: ligthColor, width: 1
                            ),
                          )
                        ),
                        child: ExpansionTile( 
                          tilePadding: const EdgeInsets.only(left: 40, right: 10),
                          childrenPadding: const EdgeInsets.only(left: 25, right: 10, top: 0, bottom: 0),
                          trailing: Text(utilsServices.listTransactionValue(transactionList!.value!), style: TextStyle(
                            color: transactionList!.type == 1 ? depositColor : expenseColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w500
                          )),
                          title: Text(transactionList!.title!, style: const TextStyle(
                            color: primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)
                          ),
                          subtitle: Text.rich(
                              TextSpan(
                                style: const TextStyle(
                                  fontSize: 15, 
                                  fontWeight: FontWeight.w400,
                                  color: secondaryGreyColor
                                ),
                                children: [
                                  TextSpan(
                                    text: utilsServices.dayFormater(transactionList!.date!), 
                                    style: const TextStyle( 
                                  )),
                                  TextSpan(text: utilsServices.monthFormater(transactionList!.date!)),
                                ]
                              )
                              ),
                          children: <ListTile>[
                            ListTile(
                              dense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                              title: Text(transactionList!.description!, style: const TextStyle(
                                color: darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )), 
                            ),
                            ListTile(
                              dense: true,
                              title: Text(transactionList!.date!, style: const TextStyle(
                                color: darkColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 28,
                    left: 10,
                    child: Image.asset(
                      transactionList!.type! == 1 
                      ? TransactionInformation.deposiTransactionPath 
                      : TransactionInformation.expenseTransactionPath,
                      width: 18,
                      height: 18,
                    )
                  )
                ],
              ),
            )
          )
        ], 
    );
  }
}