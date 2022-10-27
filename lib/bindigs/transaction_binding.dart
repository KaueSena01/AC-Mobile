import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => TransactionController());
  }
}