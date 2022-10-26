import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/repositories/transaction_repository.dart';
import 'package:atlas_coins/results/transaction_result.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/views/auth/login_screen.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{

  List<TransactionModel> allTransactions = [];

  TransactionModel transactionModel = TransactionModel();
  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();
  RxBool loading = false.obs;

  Future<void> getAllTransactions() async {

    String? token = await utilsServices.getLocalData(key: 'key');

    // if (token == null) {
    //   Get.to(LoginScreen());
    //   return;
    // }

    TransactionResult<List<TransactionModel>> result = await transactionRepository.getAllTransactions(token!);
    print(result);
    result.when(
      success: (transactions) {
        allTransactions = transactions;
        update();
      }, 
      error: (message) {

      }
    );
  }

}