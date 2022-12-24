import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/transaction/views/home/home_screen.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/components/arrow_back_widget.dart';
import 'package:atlas_coins/src/components/button_widget.dart';
import 'package:atlas_coins/src/components/input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.fromLTRB(size20, size80, size20, size30),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppInformation.appNameUpperCase,
                        style: AppTheme.lightText.displayLarge!.apply(
                          color: primaryColor,
                        ),
                      ),
                      Text(
                        "Registrar as movimentações facilita o crescimento do capital investido! ",
                        style: AppTheme.lightText.bodySmall!.apply(
                          color: tertiaryColor,
                        ),
                      ),
                      const SizedBox(height: size20),
                      InputTextWidget(
                        label: "Título:",
                        placeholder: "Título para transação",
                        controller: titleController,
                        validator: validateTransacionTitle,
                      ),
                      const SizedBox(height: size20),
                      // const DropDownWidget(label: "Tipo:"),
                      const SizedBox(height: size20),
                      InputTextWidget(
                        label: "Valor:",
                        placeholder: "Valor da transação",
                        controller: valueController,
                        validator: validateTransacionValue,
                      ),
                      const SizedBox(height: size20),
                      InputTextWidget(
                        label: "Data:",
                        placeholder: "Data da transação",
                        controller: dateController,
                        validator: validateTransacionDate,
                        isDate: true,
                      ),
                      const SizedBox(height: size20),
                      InputTextWidget(
                        label: "Descrição:",
                        placeholder:
                            "Escreva uma breve frase para esta\n transação...",
                        isDescription: true,
                        controller: descriptionController,
                        validator: validateTransacionDescription,
                      ),
                      const SizedBox(height: size30),
                      GetX<TransactionController>(
                        builder: (controller) {
                          return ButtonWidget(
                            label: ButtonLabel.save,
                            onPressed: controller.loading.value
                                ? null
                                : () {
                                    FocusScope.of(context).unfocus();

                                    if (_key.currentState!.validate()) {
                                      String title = titleController.text;
                                      String date = dateController.text;
                                      String value = valueController.text;
                                      var finalValue = double.parse(value);
                                      String description =
                                          descriptionController.text;
                                      controller.createNewTransaction(
                                        title: title,
                                        date: date,
                                        value: finalValue,
                                        description: description,
                                      );
                                    }
                                  },
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            ArrowBackWidget(
              onPressed: () => Get.to(const HomeScreen()),
            )
          ],
        ),
      ),
    );
  }
}
