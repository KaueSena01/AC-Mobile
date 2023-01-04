import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  const NoTransactions({
    Key? key,
    required this.transactionController,
  }) : super(key: key);

  final TransactionController transactionController;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: size30),
      width: double.infinity,
      height: size.height - 320,
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
            Container(
              margin: const EdgeInsets.only(top: size110),
              child: Text(
                "Você ainda não realizou\nnenhumatransação :-(",
                style: AppTheme.lightText.headlineSmall!.apply(
                  color: labelColor,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
