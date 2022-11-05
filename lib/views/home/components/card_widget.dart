import 'package:atlas_coins/controllers/auth_controller.dart';
import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/services/utils/static_value.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
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
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 180,
          color: primaryColor,
        ),
        Positioned(
          top: 60,
          child: Container( 
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
          )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    Image.asset(
                      AppInformation.appLogoPath,
                      height: 75,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Saldo total: ',style: TextStyle(
                          color: Colors.white,  
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                          )
                        ),  
                        Text(utilsServices.transactionValue(controller.totalPrice()), style: const TextStyle(
                          color:  Colors.white,  
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline
                          )
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 10),
                  child: Text(authController.auth.user!.name!, style: const TextStyle(
                    color: Colors.white,  
                    fontSize: 22,
                    fontWeight: FontWeight.w400
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 10),
                  child: Text(
                    // ignore: unrelated_type_equality_checks
                    controller.loading == true
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
                  )
                ),
                Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Row(
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
                  ))
                ]
              )
            ),
          )
        )
      ],
    );
  }
}