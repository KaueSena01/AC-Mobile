import 'package:get/get.dart';

import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransactionController());
  }
}
