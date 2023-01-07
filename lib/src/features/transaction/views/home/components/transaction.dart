import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/details.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  const Transaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Details(
            transactionDetails: transaction,
          ),
        );
      },
      child: Container(
        height: size75,
        margin: const EdgeInsets.symmetric(vertical: size10),
        padding: const EdgeInsets.all(size15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: size10),
                  height: size45,
                  width: size45,
                  decoration: BoxDecoration(
                    color: cardBackgroundColor,
                    borderRadius: BorderRadius.circular(size50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(size06),
                    child: CircleAvatar(
                      radius: size30,
                      backgroundColor: cardBackgroundColor,
                      backgroundImage: NetworkImage(
                        'https://devtools.com.br/img/pix/logo-pix-png-icone-520x520.png',
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Transação",
                      style: AppTheme.lightText.labelMedium!.apply(
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      "10 de Dezembro, 2022",
                      style: AppTheme.lightText.labelSmall!.apply(
                        color: labelColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              "+ R\$ 1000.00",
              style: AppTheme.lightText.labelLarge!.apply(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
