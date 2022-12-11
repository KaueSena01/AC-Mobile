import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/user/controller/auth_controller.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  final TransactionController controller;

  final authController = Get.find<AuthController>();

  final UtilsServices utilsServices = UtilsServices();

  CardWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - size40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size15),
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
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(size15, size10, size15, size10),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppInformation.appIconLogo,
                      height: size30,
                    ),
                    const SizedBox(width: size10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          authController.auth.name!,
                          style: AppTheme.lightText.headlineLarge!.apply(
                            color: whiteColor,
                          ),
                        ),
                        Text(
                          "Focado",
                          style: AppTheme.lightText.labelSmall!.apply(
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  color: tertiaryGreyColor,
                  height: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Todas",
                          style: AppTheme.lightText.headlineMedium!.apply(
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(
                          height: size15,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.loading.value == true
                              ? TransactionInformation.loading
                              : controller.allTransactions.isEmpty
                                  ? TransactionInformation.lastMove
                                  : utilsServices.lastTransactionType(
                                      controller.lastTransaction()),
                          style: AppTheme.lightText.labelSmall!.apply(
                            color: whiteColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              controller.loading.value == true
                                  ? TransactionInformation.noTransactionsPath
                                  : controller.allTransactions.isEmpty
                                      ? TransactionInformation
                                          .noTransactionsPath
                                      : utilsServices.lastTransactionTypeAsset(
                                          controller.lastTransaction()),
                              width: 12,
                              height: 12,
                            ),
                            const SizedBox(width: size10),
                            Text(
                              controller.loading.value == true
                                  ? TransactionInformation.zero
                                  : controller.allTransactions.isEmpty
                                      ? TransactionInformation.zero
                                      : utilsServices.lastTransactionValue(
                                          controller.lastTransaction()),
                              style: AppTheme.lightText.labelLarge!.apply(
                                color: whiteColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(height: size10),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Saldo total:",
                        style: AppTheme.lightText.labelSmall!.apply(
                          color: whiteColor,
                        ),
                      ),
                      Text(
                        utilsServices.transactionValue(controller.totalPrice()),
                        style: AppTheme.lightText.displayMedium!.apply(
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
