import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/app_bar_app.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/base_structure.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/transaction/views/transaction/components/transaction_form_step_two.dart';

class NewTransactionScreenStepTwo extends StatelessWidget {
  NewTransactionScreenStepTwo({Key? key}) : super(key: key);

  TextEditingController title = TextEditingController();
  TextEditingController value = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController description = TextEditingController();
  final TransactionController transactionController =
      Get.find<TransactionController>();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseStructure(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarApp(
              onPressed: () {},
              title: "Nova transação",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: TransactionFormStepTwo(
                  titleController: title,
                  valueController: value,
                  dateController: date,
                  descriptionController: description,
                  transactionController: transactionController,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(size20, size20, size20, size20),
              child: ButtonWidget(
                label: "Continuar",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    double valueConvert = double.parse(value.text);

                    transactionController.transactionCreationController(
                      title: title.text,
                      date: date.text,
                      value: valueConvert,
                      description: description.text,
                    );
                  }
                  Get.to(NewTransactionScreenStepTwo());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
