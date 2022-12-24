import 'package:atlas_coins/src/components/input_text_widget.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionFormStepTwo extends StatelessWidget {
  TransactionFormStepTwo({Key? key}) : super(key: key);

  final TransactionController transactionController = TransactionController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size00, horizontal: size20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Escolha um título e  um valor",
              style: AppTheme.lightText.bodyLarge!.apply(
                color: whiteColor,
              ),
            ),
            const SizedBox(height: size20),
            const InputTextWidget(
              label: "Título",
              textInputType: TextInputType.text,
            ),
            const SizedBox(height: size15),
            const InputTextWidget(
              label: "Valor",
              textInputType: TextInputType.number,
            ),
            Container(
              margin: const EdgeInsets.only(top: 03),
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Saldo disponível: ",
                      style: AppTheme.lightText.labelMedium!.apply(
                        color: labelColor,
                      ),
                    ),
                    Text(
                      transactionController.showBalance.value
                          ? "R\$ 5.643,50"
                          : "R\$ ...",
                      style: AppTheme.lightText.labelLarge!.apply(
                        color: whiteColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        transactionController.showAndHideBalance();
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: size10, right: size10),
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
                ),
              ),
            ),
            const SizedBox(height: size15),
            const InputTextWidget(
              label: "Data",
              textInputType: TextInputType.datetime,
              isDate: true,
            ),
            const SizedBox(height: size15),
            const InputTextWidget(
              label: "Descrição",
              textInputType: TextInputType.text,
              isDescription: true,
              minLines: 1,
              maxLines: 3,
            ),
            Container(
              margin: const EdgeInsets.only(top: 03),
              child: Text(
                "Escreva uma breve frase descrevendo o motivo dessa transação.",
                style: AppTheme.lightText.labelMedium!.apply(
                  color: labelColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
