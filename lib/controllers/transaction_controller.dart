import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/repositories/transaction_repository.dart';
import 'package:atlas_coins/results/transaction_result.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{

  @override
  void onInit() {
    getAllTransactions();
    super.onInit();
  }

  List<TransactionModel> allTransactions = [];

  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();
  
  RxBool loading = false.obs;

  Future<void> getAllTransactions() async {

    loading.value = true;

    String? token = await utilsServices.getLocalData(key: 'key');

    TransactionResult<List<TransactionModel>> result = await transactionRepository.getAllTransactions(token!);

    loading.value = false;

    result.when(
      success: (transactions) {
        allTransactions = transactions;
        update(); 
        totalPrice(); 
        lastTransaction();
      }, 
      error: (message) {

      }
    );
  }

  double totalPrice() {
    double total = 0;

    for(var transaction in allTransactions) {
      total += transaction.transactionValue();
    }
 
    return total;
  }

  TransactionModel lastTransaction() {
    return allTransactions.first;
  }

}