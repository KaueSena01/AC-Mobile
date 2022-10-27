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

  TransactionModel transactionModel = TransactionModel();
  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();
  RxBool loading = false.obs;

  double totalPrice() {
    double total = 0;

    for(var item in allTransactions) {
      total += item.price();
    }
 
    return total;
  }

  Future<void> getAllTransactions() async {

    loading.value = true;

    String? token = await utilsServices.getLocalData(key: 'key');

    TransactionResult<List<TransactionModel>> result = await transactionRepository.getAllTransactions(token!);

    loading.value = false;

    result.when(
      success: (transactions) {
        allTransactions = transactions;
        totalPrice(); 
        update();
      }, 
      error: (message) {

      }
    );
  }

}