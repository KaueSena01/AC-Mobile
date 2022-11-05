import 'package:atlas_coins/common/button_widget.dart';
import 'package:atlas_coins/common/drop_down_widget.dart';
import 'package:atlas_coins/common/input_text_widget.dart';
import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/services/utils/static_value.dart';
import 'package:atlas_coins/services/utils/validators.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController(); 
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var valueController = MoneyMaskedTextController(leftSymbol: 'R\$ ', thousandSeparator: '.', decimalSeparator: '.');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 30),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [ 
                      const Text(AppInformation.appNameUpperCase,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        )
                      ),
                      const Text("Registrar as movimentações facilita o crescimento do capital investido! ", style: TextStyle(
                        color: darkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                        )
                      ),
                      const SizedBox(height: 20),
                      InputTextWidget( 
                        label: "Título:",
                        placeholder: "Título para transação",
                        hint: true,
                        controller: titleController,
                        validator: validateTransacionTitle,
                      ),
                      const SizedBox(height: 20),
                      const DropDownWidget(
                        label: "Tipo:"
                      ),
                      const SizedBox(height: 20),
                      InputTextWidget( 
                        label: "Valor:",
                        placeholder: "Valor da transação",
                        hint: true, 
                        controller: valueController,
                        validator: validateTransacionValue,
                      ),
                      const SizedBox(height: 20), 
                      InputTextWidget( 
                        label: "Data:",
                        placeholder: "Data da transação",
                        hint: true,
                        controller: dateController, 
                        validator: validateTransacionDate, 
                        isDate: true,
                      ),
                      const SizedBox(height: 20),
                      InputTextWidget( 
                        label: "Descrição:",
                        placeholder: "Escreva uma breve frase para esta\n transação...",
                        hint: true,
                        isDescription: true,
                        controller: descriptionController, 
                        validator: validateTransacionDescription,
                      ),
                      const SizedBox(height: 30),
                      GetX<TransactionController>(
                        builder: (controller) {
                          return ButtonWidget(
                            label: ButtonLabel.save, 
                            onPressed: controller.loading.value
                            ? null
                            :
                            () {
                              FocusScope.of(context).unfocus();

                              if (_key.currentState!.validate()) {
                                  String title = titleController.text; 
                                  String date = dateController.text;
                                  String value = valueController.text;
                                  String description = descriptionController.text;
                                  controller.createNewTransaction(title: title, date: date, value: value, description: description);
                                }
                            }
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: SafeArea(
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: darkColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
