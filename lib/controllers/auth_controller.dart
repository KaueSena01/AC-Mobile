import 'package:atlas_coins/controllers/transaction_controller.dart';
import 'package:atlas_coins/models/auth_model.dart';
import 'package:atlas_coins/repositories/auth_repository.dart';
import 'package:atlas_coins/results/auth_result.dart';
import 'package:atlas_coins/services/utils/utils_services.dart'; 
import 'package:atlas_coins/views/auth/save_email_and_password_screen.dart';
import 'package:atlas_coins/views/home/home_screen.dart';
import 'package:atlas_coins/views/onboarding/onboarding_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  AuthModel auth = AuthModel();
  RxString userName = "".obs;
  UtilsServices utilsServices = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;
  
  String tokenKey = dotenv.get("TOKEN_KEY", fallback: "");

  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  void saveToken() {
    utilsServices.saveLocalData(key: tokenKey, data: auth.token!); 
  } 

  void saveName(String name) {
    userName.value = name;
    Get.to(SaveEmailAndPasswordScreen(name: userName.value));
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
        Get.to(const HomeScreen());
      },
      error: (message) {
        
      },
    ); 
  }

  Future<void> register({
    required String name,
    required String email,
    required String password
  }) async {

    loading.value = true;  

    AuthResult result = await authRepository.register(name: name, email: email, password: password);

    loading.value = false;

    result.when(
      success: (auth) {
        this.auth = auth;
        saveToken();
        Get.put(TransactionController());
        Get.to(const HomeScreen());
      }, 
      error: (message) async {
      }
    );
  }

  Future<void> updatePassword({
    required String newPassword
  }) async {

    loading.value = true;  

    String? token = await utilsServices.getLocalData(key: tokenKey); 
    
    AuthResult result = await authRepository.updatePassword(token: token!, newPassword: newPassword);

    loading.value = false;  

    result.when(
      success: (auth) {
        
      }, 
      error: (message) async {

      }
    );
  }

  Future<void> signOut() async {
    auth = AuthModel();

    final transactionController = Get.find<TransactionController>();

    transactionController.allTransactions = [];

    await utilsServices.deleteLocalData(key: tokenKey);

    Get.to(const OnboardingScreen());
  }
 
  Future<void> validateToken() async {

    String? token = await utilsServices.getLocalData(key: tokenKey); 
    
    if (token == null) {
      Get.to(const OnboardingScreen());
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
        Get.to(const OnboardingScreen());
      },
    );
  }
  
}