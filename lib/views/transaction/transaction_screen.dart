import 'package:atlas_coins/common/drop_down_widget.dart';
import 'package:atlas_coins/common/input_widget.dart';
import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/theme/colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatelessWidget {
  TransactionScreen({Key? key}) : super(key: key);

  final _key = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 20, 30),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Head
                      const Text("ATLAS COINS",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          )),
                      const Text(
                          "Planejar cenários futuros e calcular riscos  aumentara a taxa de crescimento do capital investido!",
                          style: TextStyle(
                              color: darkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 20),
                      InputWidget(
                        label: "Título:",
                        placeholder: "Ex: Conta de água",
                        icon: Icons.toc,
                        controller: titleController,
                      ),
                      const DropDownWidget(
                        label: "Tipo:"
                      ),
                      InputWidget(
                        isDate: true,
                        label: "Data:",
                        placeholder: "Digite a data da transação",
                        icon: Icons.date_range,
                        controller: dateController,
                      ),
                      InputWidget(
                        label: "Valor:",
                        placeholder: "Digite o valor da transação",
                        icon: Icons.attach_money,
                        controller: valueController,
                      ),
                      InputWidget(
                        isDescription: true,
                        label: "Descrição:",
                        placeholder:
                            "Escreva uma breve descrição para esta transação...",
                        icon: Icons.article_outlined,
                        controller: descriptionController,
                      ),
                      GetX<TransactionController>( 
                        builder: (controller) {
                          return 
                          Container(
                            margin: const EdgeInsets.only(top: 40),
                            height: 50,
                            child: ElevatedButton(
                              onPressed: controller.loading.value ? null : () {
                                FocusScope.of(context).unfocus();

                                if (_key.currentState!.validate()) {
                                  String title = titleController.text; 
                                  String date = dateController.text;
                                  String value = valueController.text;
                                  String description = descriptionController.text;
                                  controller.createNewTransaction(title: title, date: date, value: value, description: description);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                'Salvar',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                child: SafeArea(
                  child: Image.asset(
                    "assets/icons/background.png",
                    height: 100,
                    width: 100,
                  ),
                )
              ),
            Positioned(
              top: 15,
              left: 15,
              child: SafeArea(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: ligthColor,
                    ),
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
