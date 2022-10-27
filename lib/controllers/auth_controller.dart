import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/models/auth_model.dart';
import 'package:atlas_coins/repositories/auth_repository.dart';
import 'package:atlas_coins/results/auth_result.dart';
import 'package:atlas_coins/services/utils/utils_services.dart';
import 'package:atlas_coins/views/auth/login_screen.dart';
import 'package:atlas_coins/views/home/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  AuthModel auth = AuthModel();
  UtilsServices utilsServices = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  void saveToken() {
    utilsServices.saveLocalData(key: 'key', data: auth.token!); 
  } 

  Future login({
    required String email,
    required String password
  }) async {
    loading.value = true;  
 
    AuthResult result = await authRepository.login(
      email: email, 
      password: password
    );

    loading.value = false;

    result.when(
      success: (auth) { 
        this.auth = auth;
        saveToken();
        Get.put(TransactionController());
        Get.to(HomeScreen());
      },
      error: (message) {
      },
    ); 
  }

  Future<void> validateToken() async {

    String? token = await utilsServices.getLocalData(key: 'key'); 
    
    if (token == null) {
      Get.to(LoginScreen());
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (auth) {
        this.auth = auth; 
        Get.put(TransactionController());
        Get.to(const HomeScreen());
        saveToken();
      },
      error: (message) async {

      },
    );
  }
  
}