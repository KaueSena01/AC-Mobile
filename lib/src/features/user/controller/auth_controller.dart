import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:atlas_coins/src/features/user/model/user_model.dart';
import 'package:atlas_coins/src/features/user/result/auth_result.dart';
import 'package:atlas_coins/src/features/user/repository/auth_repository.dart';
import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  UserModel auth = UserModel();
  UtilsServices utilsServices = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;
  RxString userName = "".obs;

  String tokenKey = dotenv.get("TOKEN_KEY", fallback: "");

  void saveToken(UserModel auth) {
    utilsServices.saveLocalData(key: tokenKey, data: auth.token!);
  }

  void saveName(String name) async {
    Get.toNamed(AppRoutes.registerLoginRoute, arguments: [
      {"Name": name},
    ]);
  }

  Future login({
    required String email,
    required String password,
  }) async {
    loading.value = true;

    AuthResult result = await authRepository.login(
      email: email,
      password: password,
    );

    loading.value = false;

    result.when(
      success: (auth) {
        this.auth = auth;
        saveToken(auth);
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) {},
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    loading.value = true;

    AuthResult result = await authRepository.register(
      name: name,
      email: email,
      password: password,
    );

    loading.value = false;

    result.when(
      success: (auth) {
        this.auth = auth;
        saveToken(auth);
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {},
    );
  }

  Future<void> updatePassword({required String newPassword}) async {
    loading.value = true;

    String? token = await utilsServices.getLocalData(key: tokenKey);

    AuthResult result = await authRepository.updatePassword(
      token: token!,
      newPassword: newPassword,
    );

    loading.value = false;

    result.when(
      success: (auth) {},
      error: (message) async {},
    );
  }

  Future<void> signOut() async {
    Get.delete<TransactionController>();

    await utilsServices.deleteLocalData(key: tokenKey);

    Get.toNamed(AppRoutes.onboardingRoute);
  }

  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: tokenKey);

    if (token == null) {
      Get.toNamed(AppRoutes.onboardingRoute);
      return;
    }

    AuthResult result = await authRepository.validateToken(token);

    result.when(
      success: (auth) {
        this.auth = auth;
        saveToken(auth);
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {
        Get.toNamed(AppRoutes.onboardingRoute);
      },
    );
  }
}
