import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/repository/transaction_repository.dart';
import 'package:atlas_coins/src/features/transaction/result/transaction_result.dart';
import 'package:atlas_coins/src/features/transaction/views/home/home_screen.dart';
import 'package:atlas_coins/src/features/user/views/user/user_profile_screen.dart';
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

  TransactionRepository transactionRepository = TransactionRepository();
  UtilsServices utilsServices = UtilsServices();

  RxInt transactionType = 0.obs;
  RxInt paymentOptions = 0.obs;

  RxBool loading = false.obs;

  RxDouble transactionValue = 0.0.obs;

  Future createNewTransaction({
    required String title,
    required String date,
    required double value,
    required String description,
  }) async {
    loading.value = true;

    String? token = await utilsServices.getLocalData(key: tokenKey);

    if (transactionType.value == 1) {
      transactionValue.value = -value;
    } else {
      transactionValue.value = value;
    }

    TransactionResult result = await transactionRepository.createNewTransaction(
      token!,
      title,
      transactionType.value,
      paymentOptions.value,
      transactionValue.value,
      date,
      description,
    );

    loading.value = false;

    result.when(
      success: (transactions) {
        refresh();
        getAllTransactions();
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) {},
    );
  }

  int setTransactionType(String value, String functionType) {
    if (functionType == "Payment") {
      switch (value) {
        case "Dinheiro":
          paymentOptions.value = 0;
          break;

        case "PIX":
          paymentOptions.value = 1;
          break;

        case "Cartão":
          paymentOptions.value = 2;
          break;

        case "Agência":
          paymentOptions.value = 3;
          break;
      }
    } else {
      switch (value) {
        case TransactionType.deposit:
          transactionType.value = 0;
          break;

        case TransactionType.expense:
          transactionType.value = 1;
          break;
      }
    }

    update();

    return transactionType.value | paymentOptions.value;
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

  String totalPrice() {
    double total = 0;
    double depositTotal = 0;

    for (var transaction in allTransactions) {
      total += transaction.transactionValue();
    }

    String value = utilsServices.valueFormater(total);

    return value;
  }

  TransactionModel lastTransaction() {
    return allTransactions.first;
  }

  void setDateNow() async {
    DateTime a = DateTime.now();

    dateNow.value = UtilData.obterDataDDMMAAAA(a);
    refresh();
  }

  RxBool showBalance = false.obs;

  bool showAndHideBalance() {
    showBalance.value = !showBalance.value;
    update();

    return showBalance.value;
  }

  RxInt pageIndex = 0.obs;

  int navigatePageView(int page) {
    switch (page) {
      case 0:
        Get.to(() => const HomeScreen());
        break;
      case 1:
        Get.toNamed(AppRoutes.newTransactionRoute);
        break;
      case 2:
        Get.toNamed(AppRoutes.newTransactionRoute);
        break;
      case 3:
        Get.to(() => const UserProfileScreen());
        break;
    }

    pageIndex.value = page;
    update();

    return pageIndex.value;
  }
}
