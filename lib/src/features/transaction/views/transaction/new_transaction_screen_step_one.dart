import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/new_transaction_screen_step_two.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/components/transaction_form_step_one.dart';

class NewTransactionScreenStepOne extends StatelessWidget {
  NewTransactionScreenStepOne({Key? key}) : super(key: key);

  final trasactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      onWillPop: () async {
        Get.off(
          trasactionController.navigatePageView(0),
        );
        return false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBarApp(
            onPressed: () => Get.off(
              trasactionController.navigatePageView(0),
            ),
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
              onPressed: () => Get.to(NewTransactionScreenStepTwo()),
            ),
          )
        ],
      ),
    );
  }
}
