import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/transaction.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: size30),
      width: size.width,
      height: transactionController.transacitonList.length <= 2
          ? size.height * 0.55
          : null,
      decoration: const BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(size40),
          topRight: Radius.circular(size40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(size15, size20, size15, size20),
        child: Column(
          children: [
            Text(
              "Meu extrato",
              style: AppTheme.lightText.titleMedium!.apply(
                color: whiteColor,
              ),
            ),
            GetBuilder<TransactionController>(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(top: size10),
                  child: Column(
                    children: transactionController.transacitonList
                        .map(
                          (transaction) => Transaction(
                            transaction: transaction,
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
