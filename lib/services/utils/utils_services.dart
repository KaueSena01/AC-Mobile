import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/services/utils/static_value.dart';
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

    return numberFormat.format(transactionValue);
  }

  String lastTransactionType(TransactionModel transaction) {

    if(transaction.type == 1) return TransactionType.deposit;
    
    return TransactionType.expense;
  }

  String lastTransactionTypeAsset(TransactionModel transaction) {

    if(transaction.type == 1) return TransactionInformation.deposiTransactionPath;
    
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

    return newValue;
  }

  String monthFormater(String date) {

    var month = date.substring(3, 5);
    var result = "";

    switch(month) {
      case "01" :
        result = "Jan";
      break;

      case "02":
        result = "Fev"; 
      break;
        
      case "03":
        result = "Mar"; 
      break;

      case "04":
        result = "Abr"; 
      break;
      
      case "05":
        result ="Mai"; 
      break;

      case "06":
        result = "Jun"; 
      break;

      case "07":
        result = "Jul"; 
      break;

      case "08":
        result = "Ago"; 
      break;

      case "09":
        result = "Set"; 
      break;

      case "10":
        result = "Out"; 
      break;

      case "11":
        result = "Nov"; 
      break;

      case "12":
        result = "Dez"; 
      break;  
    }

    return result;
  }
}