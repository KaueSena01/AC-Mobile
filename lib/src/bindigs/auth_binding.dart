import 'package:atlas_coins/src/controllers/auth_controller.dart';
import 'package:get/get.dart'; 

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}