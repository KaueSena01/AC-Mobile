import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/repository/transaction_repository.dart';
import 'package:atlas_coins/src/features/transaction/result/transaction_result.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getAllTransactions();
  }

  String tokenKey = dotenv.get("TOKEN_KEY", fallback: "");

  List<TransactionModel> allTransactions = [];

  TransactionModel transaciton = TransactionModel();

  RxString dateNow = "".obs;
  RxInt transactionType = 1.obs;

  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();

  RxBool loading = false.obs;

  RxDouble newValue = 0.0.obs;

  Future createNewTransaction(
      {required String title,
      required String date,
      required double value,
      required String description}) async {
    loading.value = true;

    String? token = await utilsServices.getLocalData(key: tokenKey);

    if (transactionType.value == 0) {
      newValue.value = -value;
    }

    TransactionResult result = await transactionRepository.createNewTransaction(
        token!,
        title,
        transactionType.value,
        date,
        newValue.value == 0 ? value : newValue.value,
        description);

    loading.value = false;

    result.when(
        success: (transactions) {
          refresh();
          getAllTransactions();
          Get.toNamed(AppRoutes.homeRoute);
        },
        error: (message) {});
  }

  Future<void> getAllTransactions() async {
    loading.value = true;

    String? token = await utilsServices.getLocalData(key: tokenKey);

    TransactionResult<List<TransactionModel>> result =
        await transactionRepository.getAllTransactions(token!);

    loading.value = false;

    result.when(
        success: (transactions) {
          allTransactions = transactions;
          update();
          totalPrice();
          if (allTransactions.isNotEmpty) {
            lastTransaction();
          }
        },
        error: (message) {});
  }

  double totalPrice() {
    double total = 0;

    for (var transaction in allTransactions) {
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
    if (value == TransactionType.expense) {
      transactionType.value = 0;
    } else {
      transactionType.value = 1;
    }

    update();
  }

  RxBool showBalance = false.obs;

  bool showAndHideBalance() {
    showBalance.value = !showBalance.value;
    update();

    return showBalance.value;
  }
}
