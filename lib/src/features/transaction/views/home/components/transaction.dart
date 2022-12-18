import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  final TransactionModel? transactionList;
  final UtilsServices utilsServices = UtilsServices();

  Transaction({Key? key, required this.transactionList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size05),
                topRight: Radius.circular(size05),
              ),
            ),
            child: Stack(
              children: [
                Card(
                  color: Colors.white,
                  elevation: size00,
                  margin: const EdgeInsets.all(size00),
                  child: ClipPath(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: tertiaryColor, width: 1),
                        ),
                      ),
                      child: ExpansionTile(
                        tilePadding:
                            const EdgeInsets.only(left: size40, right: size10),
                        childrenPadding: const EdgeInsets.only(
                            left: size25,
                            right: size10,
                            top: size00,
                            bottom: size00),
                        trailing: Text(
                          utilsServices
                              .listTransactionValue(transactionList!.value!),
                          style: AppTheme.lightText.titleSmall!.apply(
                            color: transactionList!.type == 1
                                ? primaryColor
                                : tertiaryColor,
                          ),
                        ),
                        title: Text(
                          transactionList!.title!,
                          style: AppTheme.lightText.titleMedium!.apply(
                            color: primaryColor,
                          ),
                        ),
                        subtitle: Text.rich(
                          TextSpan(
                            style: AppTheme.lightText.labelMedium!.apply(
                              color: primaryColor,
                            ),
                            children: [
                              TextSpan(
                                text: utilsServices
                                    .dayFormater(transactionList!.date!),
                                style: const TextStyle(),
                              ),
                              TextSpan(
                                text: utilsServices
                                    .monthFormater(transactionList!.date!),
                              ),
                            ],
                          ),
                        ),
                        children: <ListTile>[
                          ListTile(
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: size00, horizontal: size15),
                            title: Text(
                              transactionList!.description!,
                              style: AppTheme.lightText.headlineSmall!.apply(
                                color: primaryColor,
                              ),
                            ),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(
                              transactionList!.date!,
                              style: AppTheme.lightText.headlineSmall!.apply(
                                color: primaryColor,
                              ),
                            ),
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
