import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/components/transaction_form_step_one.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/new_transaction_screen_step_two.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTransactionScreenStepOne extends StatelessWidget {
  const NewTransactionScreenStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarApp(
              onPressed: () {},
              title: "Nova transação",
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: TransactionFormStepOne(),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(size20),
              child: ButtonWidget(
                label: "Continuar",
                onPressed: () => Get.to(const NewTransactionScreenStepTwo()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
