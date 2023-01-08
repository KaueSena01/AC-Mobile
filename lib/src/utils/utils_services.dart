import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

class UtilsServices {
  final storage = const FlutterSecureStorage();

  Future<void> saveLocalData({
    required String key,
    required String data,
  }) async {
    await storage.write(key: key, value: data);
  }

  Future<String?> getLocalData({
    required String key,
  }) async {
    return await storage.read(key: key);
  }

  Future<void> deleteLocalData({
    required String key,
  }) async {
    await storage.delete(key: key);
  }

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
    late String value;
    late String transactionValueFormater;

    value = valueFormater(transactionValue);

    transactionValueFormater = transactionType == 0 ? "+ $value" : "- $value";

    return transactionValueFormater;
  }

  String transactionType(int transactionType) {
    if (transactionType == 1) return "Despesa de";

    return "Depósito de";
  }

  String titleFormart(String transactionTitle) {
    if (transactionTitle.length < 10) {
      return transactionTitle;
    } else {
      var title = transactionTitle.substring(0, 10);
      return "$title...";
    }
  }

  String dateFormart(String date) {
    var month = date.substring(3, 5);
    var day = date.substring(0, 2);
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
