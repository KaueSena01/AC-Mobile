import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/components/transaction_form_step_two.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTransactionScreenStepTwo extends StatelessWidget {
  const NewTransactionScreenStepTwo({Key? key}) : super(key: key);

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
            Expanded(
              child: SingleChildScrollView(
                child: TransactionFormStepTwo(),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(size20, size00, size20, size20),
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
