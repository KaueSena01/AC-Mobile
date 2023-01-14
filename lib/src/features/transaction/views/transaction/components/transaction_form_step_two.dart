import 'package:atlas_coins/src/components/input_text_widget.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/theme/app_theme.dart';
import 'package:atlas_coins/src/theme/constants.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionFormStepTwo extends StatelessWidget {
  TransactionFormStepTwo({
    Key? key,
    required this.titleController,
    required this.valueController,
    required this.dateController,
    required this.descriptionController,
    required this.transactionController,
  }) : super(key: key);

  final TextEditingController titleController;
  final TextEditingController valueController;
  final TextEditingController dateController;
  final TextEditingController descriptionController;
  final TransactionController transactionController;

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: size00, horizontal: size20),
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
          InputTextWidget(
            label: "Título",
            textInputType: TextInputType.text,
            controller: titleController,
            validator: validateTransacionTitle,
          ),
          const SizedBox(height: size15),
          InputTextWidget(
            label: "Valor",
            textInputType: TextInputType.number,
            controller: valueController,
            validator: validateTransacionValue,
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
                        ? utilsServices.totalPrice(
                            transactionController.transacitonList,
                          )
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
          InputTextWidget(
            label: "Data",
            textInputType: TextInputType.datetime,
            isDate: true,
            controller: dateController,
            validator: validateTransacionDate,
          ),
          const SizedBox(height: size15),
          InputTextWidget(
            label: "Descrição",
            textInputType: TextInputType.text,
            isDescription: true,
            minLines: 1,
            maxLines: 3,
            controller: descriptionController,
            validator: validateTransacionDescription,
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
    );
  }
}
