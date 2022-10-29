import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/results/transaction_result.dart';
import 'package:atlas_coins/services/endpoints.dart';
import 'package:atlas_coins/services/http_menager.dart';

class TransactionRepository {
  final HttpManager _httpManager = HttpManager();

  Future<TransactionResult<List<TransactionModel>>> getAllTransactions(String token) async {

    final result = await _httpManager.restRequest(
      url: EndPoints.listtransactions, 
      method: HttpMethods.post,
      headers: {
        'Authorization': 'Bearer '+token
    });

    if(result['result'] != null) {

    List<TransactionModel> data = 
      List<Map<String, dynamic>>.from(result['result'])
        .map(TransactionModel.fromJson)
        .toList();

      return TransactionResult<List<TransactionModel>>.success(data);
    }
    else {
      return TransactionResult.error('Ocorreu um erro inesperado');
    }
  }
}