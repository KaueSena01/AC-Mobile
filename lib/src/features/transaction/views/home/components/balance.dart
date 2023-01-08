import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Balance extends StatelessWidget {
  Balance({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  final TransactionController transactionController;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(size15, size30, size15, size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Saldo disponível:",
                    style: AppTheme.lightText.labelMedium!.apply(
                      color: labelColor,
                    ),
                  ),
                  Obx(
                    () {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            transactionController.showBalance.value
                                ? transactionController.totalPrice()
                                : "R\$ ...",
                            style: AppTheme.lightText.displayLarge!.apply(
                              color: whiteColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              transactionController.showAndHideBalance();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: size10, right: size10),
                              child: Icon(
                                transactionController.showBalance.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: size20,
                                color: labelColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
