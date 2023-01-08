import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  const Details({
    Key? key,
    required this.transactionDetails,
  }) : super(key: key);

  final TransactionModel transactionDetails;

  @override
  Widget build(BuildContext context) {
    final Color detailsColor =
        transactionDetails.type == 0 ? primaryColor : expenseColor;

    final UtilsServices utilsServices = UtilsServices();

    return DraggableScrollableSheet(
      initialChildSize: 0.81,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (_, controller) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(size40),
          ),
          color: cardBackgroundColor,
        ),
        padding: const EdgeInsets.fromLTRB(size15, size20, size15, size20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Detalhes da transação",
                      textAlign: TextAlign.center,
                      style: AppTheme.lightText.titleSmall!.apply(
                        color: whiteColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: size25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                utilsServices.transactionType(
                                  transactionDetails.type!,
                                ),
                                style: AppTheme.lightText.labelMedium!.apply(
                                  color: whiteColor,
                                ),
                              ),
                              Text(
                                utilsServices.transactionValueFormater(
                                  transactionDetails.value!,
                                  transactionDetails.type!,
                                ),
                                style: AppTheme.lightText.titleMedium!.apply(
                                  color: detailsColor,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: size40,
                            width: size40,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(size25),
                            ),
                          )
                        ],
                      ),
                    ),
                    Text(
                      transactionDetails.description!,
                      style: AppTheme.lightText.labelSmall!.apply(
                        color: lighterColor,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: size20),
                      height: 0.5,
                      color: lightColor,
                    ),
                    infoDetails(
                      context,
                      "Idenficação",
                      transactionDetails.title!,
                      detailsColor,
                    ),
                    infoDetails(
                      context,
                      "Forma de pagamento",
                      utilsServices.paymentOptionsFormater(
                        transactionDetails.paymentOption!,
                      ),
                      detailsColor,
                    ),
                    infoDetails(
                      context,
                      "Data",
                      transactionDetails.date!,
                      detailsColor,
                    ),
                  ],
                ),
              ),
            ),
            ButtonWidget(
              label: "Fechar",
              backgroundColor: detailsColor,
              onPressed: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoDetails(BuildContext context, String title, String description,
      Color detailsColor) {
    return Container(
      padding: const EdgeInsets.only(bottom: size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.lightText.labelMedium!.apply(
              color: whiteColor,
            ),
          ),
          Text(
            description,
            style: AppTheme.lightText.headlineMedium!.apply(
              color: detailsColor,
            ),
          ),
        ],
      ),
    );
  }
}
