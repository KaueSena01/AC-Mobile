import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/views/home/components/details.dart';

class Transaction extends StatelessWidget {
  Transaction({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final TransactionModel transaction;
  final UtilsServices utilsServices = UtilsServices();

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
                  child: Padding(
                    padding: const EdgeInsets.all(size08),
                    child: transaction.paymentOption == 1
                        ? Image.asset("assets/icons/pix_logo.png")
                        : SvgPicture.asset(
                            utilsServices.imageFormat(
                              transaction.paymentOption!,
                            ),
                          ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      utilsServices.titleFormart(
                        transaction.title!,
                      ),
                      style: AppTheme.lightText.labelMedium!.apply(
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      utilsServices.dateFormart(transaction.date!),
                      style: AppTheme.lightText.labelSmall!.apply(
                        color: labelColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Text(
              utilsServices.transactionValueFormater(
                transaction.value!,
                transaction.type!,
              ),
              style: AppTheme.lightText.labelLarge!.apply(
                color: transaction.type == 0 ? primaryColor : expenseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
