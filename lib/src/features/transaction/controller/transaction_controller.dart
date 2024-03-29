import 'package:get/get.dart';

import 'package:atlas_coins/src/utils/settings.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/components/modal_error.dart';
import 'package:atlas_coins/src/features/transaction/model/transaction_model.dart';
import 'package:atlas_coins/src/features/transaction/result/transaction_result.dart';
import 'package:atlas_coins/src/features/transaction/repository/transaction_repository.dart';

class TransactionController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    findAllTransactionsController('');
  }

  RxBool loading = false.obs;
  RxString searchTitle = ''.obs;
  List<TransactionModel> transacitonList = [];
  UtilsServices utilsServices = UtilsServices();
  TransactionRepository transactionRepository = TransactionRepository();

  Future<void> findAllTransactionsController(String title) async {
    String? token = await utilsServices.getStoredToken();

    TransactionResult<List<TransactionModel>> transactionResult =
        await transactionRepository.findAllTransactionsRepository(
      token!,
      title,
    );

    transactionResult.when(
      success: (transactionModel) {
        transacitonList = transactionModel;
        utilsServices.totalPrice(transacitonList);
        update();
      },
      error: (message) {
        bottomSheet(
          message: message,
          height: 330,
          onPressed: () => Get.back(),
        );
      },
    );
  }

  Future transactionCreationController({
    required String title,
    required String date,
    required double value,
    required String description,
  }) async {
    loading.value = true;

    String? token = await utilsServices.getStoredToken();

    TransactionResult result =
        await transactionRepository.transactionCreationRepository(
      token!,
      title,
      transactionType.value,
      paymentOptions.value,
      transactionType.value == 0 ? value : -value,
      date,
      description,
    );

    loading.value = false;

    result.when(
      success: (transactions) {
        refresh();
        findAllTransactionsController('');
        navigatePageView(0);
      },
      error: (message) {
        bottomSheet(
          message: message,
          height: 330,
          onPressed: () => Get.back(),
        );
      },
    );
  }

  // Transaction utility services
  RxInt pageIndex = 0.obs;
  RxInt paymentOptions = 0.obs;
  RxInt transactionType = 0.obs;
  RxBool showBalance = false.obs;

  int setTransactionType(String value, String dropDowType) {
    if (dropDowType == DropDownType.paymentOptions) {
      switch (value) {
        case PaymentOptions.money:
          paymentOptions.value = 0;
          break;

        case PaymentOptions.pix:
          paymentOptions.value = 1;
          break;

        case PaymentOptions.card:
          paymentOptions.value = 2;
          break;

        case PaymentOptions.agency:
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

  bool showAndHideBalance() {
    showBalance.value = !showBalance.value;
    update();

    return showBalance.value;
  }

  Future<int> navigatePageView(int page) async {
    Future.delayed(const Duration(milliseconds: 300), () {
      switch (page) {
        case 0:
          Get.toNamed(AppRoutes.homeRoute);
          findAllTransactionsController('');
          break;
        case 1:
          Get.toNamed(AppRoutes.newTransactionRoute);
          break;
        // case 2:
        //   Get.toNamed(AppRoutes.newTransactionRoute);
        //   break;
        case 3:
          Get.toNamed(AppRoutes.profileRoute);
          break;
      }
    });

    pageIndex.value = page;
    update();

    return pageIndex.value;
  }
}
