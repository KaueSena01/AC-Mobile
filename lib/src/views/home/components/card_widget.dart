import 'package:atlas_coins/src/controllers/auth_controller.dart';
import 'package:atlas_coins/src/controllers/transaction_controller.dart';
import 'package:atlas_coins/src/services/utils/static_values.dart';
import 'package:atlas_coins/src/services/utils/utils_services.dart';
import 'package:atlas_coins/src/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {

  final TransactionController controller;

  final authController = Get.find<AuthController>();

  final UtilsServices utilsServices = UtilsServices();

  CardWidget({ 
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( 
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container( 
          width: MediaQuery.of(context).size.width - 20, 
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0.1,
            0.9,
          ],
          colors: [
            tertiaryColor,
            secondaryColor, 
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppInformation.appIconLogo,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(authController.auth.user!.name!, style: const TextStyle(
                          color: Colors.white,  
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                          )
                        ),
                        const Text("Focado", style: TextStyle(
                          color: Colors.white,  
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                          )
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  color: mainGreyColor,
                  height: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        Text("Todas", style: TextStyle(
                          color: Colors.white,  
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                          )
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( 
                          controller.loading.value == true
                          ? TransactionInformation.loading
                          : 
                          controller.allTransactions.isEmpty 
                          ? TransactionInformation.lastMove
                          : 
                          utilsServices.lastTransactionType(controller.lastTransaction()), style: const TextStyle(
                          color: Colors.white,  
                          fontSize: 15,
                          fontWeight: FontWeight.w300
                          )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              controller.loading.value == true
                              ? TransactionInformation.noTransactionsPath
                              : 
                              controller.allTransactions.isEmpty 
                              ? TransactionInformation.noTransactionsPath
                              : 
                              utilsServices.lastTransactionTypeAsset(controller.lastTransaction()),
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              controller.loading.value == true
                              ? TransactionInformation.zero
                              : 
                              controller.allTransactions.isEmpty 
                              ? TransactionInformation.zero
                              : utilsServices.lastTransactionValue(controller.lastTransaction()), style: const TextStyle(
                                  color: Colors.white,  
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500
                                )
                              )
                            ],
                          )
                      ],
                    )
                  ],
                ), 
                const SizedBox(height: 12),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      const Text("Saldo total:", style: TextStyle(
                          color: Colors.white,  
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        )
                      ),
                      Text(utilsServices.transactionValue(controller.totalPrice()), style: const TextStyle(
                        color:  Colors.white,  
                        fontSize: 22,
                        fontWeight: FontWeight.w600, 
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
}