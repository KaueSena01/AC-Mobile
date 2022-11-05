import 'package:atlas_coins/models/transaction_model.dart';
import 'package:atlas_coins/repositories/transaction_repository.dart';
import 'package:atlas_coins/results/transaction_result.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/views/home/home_screen.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController{

  @override
  void onInit() {
    getAllTransactions();
    super.onInit();
  }

  List<TransactionModel> allTransactions = [];

  TransactionModel transaciton = TransactionModel();

  RxString dateNow = "".obs; 
  RxString newValue = "".obs;
  RxInt transactionType = 1.obs;

  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();
  
  RxBool loading = false.obs;

  Future createNewTransaction({
    required String title, 
    required String date,
    required String value,
    required String description
  }) async {

    loading.value = true; 

    String? token = await utilsServices.getLocalData(key: 'key');

    var newValue = utilsServices.valueFormater(value);

    if(transactionType.value == 0) {
      newValue = "-$newValue";   
    }

    TransactionResult result = await 
      transactionRepository.createNewTransaction(
        token!,
        title, transactionType.value, date, newValue, description
    );

    loading.value = false;
    
    result.when(
      success: (transactions) {
        refresh(); 
        Get.to(const HomeScreen());
      }, 
      error: (message) {
        
      }
    );
  }

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
        if(allTransactions.isNotEmpty) {
          lastTransaction();
        } 
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

  void setDateNow() async {
    DateTime a = DateTime.now();

    dateNow.value = UtilData.obterDataDDMMAAAA(a);
    refresh();
  }

  void setTransactionType(String value) {
    if(value == "Despesa") {
      transactionType.value = 0; 
    } else {
      transactionType.value = 1; 
    }

    update();
  }

}