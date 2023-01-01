import 'package:atlas_coins/src/components/drop_down_widget.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';

class TransactionFormStepOne extends StatelessWidget {
  const TransactionFormStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size15),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: size20),
              child: Text(
                "Por favor, selecione o tipo e o meio de transação",
                style: AppTheme.lightText.displayMedium!.apply(
                  color: whiteColor,
                ),
              ),
            ),
            const DropDownWidget(
              label: "Tipo",
            ),
            const SizedBox(height: size30),
            const DropDownWidget(
              label: "Meio",
              isPaymentOptions: true,
            ),
          ],
        ),
      ),
    );
  }
}
