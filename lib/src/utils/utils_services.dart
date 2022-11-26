import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/utils/settings.dart';
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

  String transactionValue(double transactionValue) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    final String value = numberFormat.format(transactionValue);

    return value;
  }

  String listTransactionValue(double transactionValue) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    late String value = numberFormat.format(transactionValue);

    if (transactionValue > 0) {
      return value = "+ $value";
    }

    value = value.substring(1, value.length);
    value = "- $value";

    return value;
  }

  String lastTransactionType(TransactionModel transaction) {
    if (transaction.type == 1) return TransactionType.deposit;

    return TransactionType.expense;
  }

  String lastTransactionTypeAsset(TransactionModel transaction) {
    if (transaction.type == 1) {
      return TransactionInformation.deposiTransactionPath;
    }

    return TransactionInformation.expenseTransactionPath;
  }

  String lastTransactionValue(TransactionModel transaction) {
    var value = transactionValue(transaction.value!);

    return value;
  }

  String dayFormater(String date) {
    var day = date.substring(0, 2);

    return day;
  }

  String valueFormater(String value) {
    String newValue = value.substring(3);

    if (newValue.length == 9) {
      String cen = newValue.substring(0, 2);
      String dez = newValue.substring(3, newValue.length);

      newValue = '$cen$dez';
    }

    return newValue;
  }

  String monthFormater(String date) {
    var month = date.substring(3, 5);
    var result = "";

    switch (month) {
      case "01":
        result = " de janeiro";
        break;

      case "02":
        result = " de fevereiro";
        break;

      case "03":
        result = " de março";
        break;

      case "04":
        result = " de abril";
        break;

      case "05":
        result = " de maio";
        break;

      case "06":
        result = " de junho";
        break;

      case "07":
        result = " de julho";
        break;

      case "08":
        result = " de agosto";
        break;

      case "09":
        result = " de setembro";
        break;

      case "10":
        result = " de outubro";
        break;

      case "11":
        result = " de novembro";
        break;

      case "12":
        result = " de dezembro";
        break;
    }

    return result;
  }
}
