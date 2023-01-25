import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:atlas_coins/src/features/auth/model/auth_model.dart';
import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';

class UtilsServices {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String key = dotenv.get("TOKEN_KEY", fallback: "");

  Future<void> storeToken({
    required AuthModel authModel,
  }) async {
    await storage.write(key: key, value: authModel.token);
  }

  Future<String?> getStoredToken() async {
    return await storage.read(key: key);
  }

  Future<void> deleteStoradToken() async {
    await storage.delete(key: key);
  }

  void storeName(String name) async {
    Get.toNamed(AppRoutes.registerLoginRoute, arguments: [
      {"Name": name},
    ]);
  }

  String totalPrice(List<TransactionModel> transacitonList) {
    double total = 0;

    for (var transaction in transacitonList) {
      total += transaction.transactionValue();
    }

    String value = valueFormater(total);

    return value;
  }

  RxBool showBalance = false.obs;

  String paymentOptionsFormater(int paymentOption) {
    var option = "";

    switch (paymentOption) {
      case 0:
        option = "Dinheiro";
        break;
      case 1:
        option = "PIX";
        break;
      case 2:
        option = "Cartão";
        break;
      case 3:
        option = "Agência";
        break;
    }

    return option;
  }

  String valueFormater(double transactionValue) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    final String value = numberFormat.format(transactionValue);

    return value;
  }

  String transactionValueFormater(
    double transactionValue,
    int transactionType,
  ) {
    String value;
    String transactionValueFormater;

    String total = transactionValue.toString();

    String removeMinusSign = total.replaceAll(RegExp('-'), '');

    double cleanTransactionAmount = double.parse(removeMinusSign);

    value = valueFormater(cleanTransactionAmount);

    transactionValueFormater = transactionType == 0 ? "+ $value" : "- $value";

    return transactionValueFormater;
  }

  String transactionType(int transactionType) {
    if (transactionType == 1) return "Despesa de";

    return "Depósito de";
  }

  String titleFormart(String transactionTitle) {
    if (transactionTitle.length < 11) {
      return transactionTitle;
    } else {
      var title = transactionTitle.substring(0, 11);
      return "$title...";
    }
  }

  String dateFormart(String date) {
    var day = date.substring(0, 2);
    var month = date.substring(3, 5);
    var year = date.substring(6, 10);

    var result = "";

    switch (month) {
      case "01":
        result = "$day de Janeiro, $year";
        break;

      case "02":
        result = "$day de Fevereiro, $year";
        break;

      case "03":
        result = "$day de Março, $year";
        break;

      case "04":
        result = "$day de Abril, $year";
        break;

      case "05":
        result = "$day de Maio, $year";
        break;

      case "06":
        result = "$day de Junho, $year";
        break;

      case "07":
        result = "$day de Julho, $year";
        break;

      case "08":
        result = "$day de Agosto, $year";
        break;

      case "09":
        result = "$day de Setembro, $year";
        break;

      case "10":
        result = "$day de Outubro, $year";
        break;

      case "11":
        result = "$day de Novembro, $year";
        break;

      case "12":
        result = "$day de Dezembro, $year";
        break;
    }

    return result;
  }

  String imageFormat(int paymentOption) {
    late String path;

    switch (paymentOption) {
      case 0:
        path = "assets/icons/money_logo.svg";
        break;
      case 2:
        path = "assets/icons/card.svg";
        break;
      case 3:
        path = "assets/icons/money_logo.svg";
        break;
    }

    return path;
  }
}
