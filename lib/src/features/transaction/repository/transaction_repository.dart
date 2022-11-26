import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/result/transaction_result.dart';
import 'package:atlas_coins/src/services/endpoints.dart';
import 'package:atlas_coins/src/services/http_menager.dart';

class TransactionRepository {
  final HttpManager _httpManager = HttpManager();

  Future<TransactionResult<List<TransactionModel>>> getAllTransactions(
      String token) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.listtransactions,
        method: HttpMethods.post,
        headers: {'Authorization': 'Bearer ' + token});

    if (result['result'] != null) {
      List<TransactionModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(TransactionModel.fromJson)
              .toList();

      return TransactionResult<List<TransactionModel>>.success(data);
    } else {
      return TransactionResult.error('Ocorreu um erro inesperado');
    }
  }

  Future<TransactionResult> createNewTransaction(String token, String title,
      int type, String date, String value, String description) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.createtransaction,
        method: HttpMethods.post,
        headers: {
          'Authorization': 'Bearer ' + token
        },
        body: {
          'type': type,
          'title': title,
          'description': description,
          'date': date,
          'value': value
        });

    if (result['result'] != null) {
      TransactionModel data = TransactionModel.fromJson(result['result']);
      return TransactionResult<TransactionModel>.success(data);
    } else {
      return TransactionResult.error('Ocorreu um erro inesperado');
    }
  }
}
