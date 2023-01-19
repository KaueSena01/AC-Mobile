import 'package:atlas_coins/src/components/modal_error.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/features/auth/model/auth_model.dart';
import 'package:atlas_coins/src/features/auth/result/auth_result.dart';
import 'package:atlas_coins/src/features/auth/repository/auth_repository.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkTokenController();
  }

  AuthModel authModel = AuthModel();
  UtilsServices utilServices = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;

  Future<void> signUpController({
    required String name,
    required String email,
    required String password,
  }) async {
    AuthResult authResult = await authRepository.signUpRepository(
      name: name,
      email: email,
      password: password,
    );

    authResult.when(
      success: (authModel) {
        this.authModel = authModel;
        utilServices.storeToken(authModel: authModel);
        update();
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {
        // Mensagem de erro
      },
    );
  }

  Future<void> signInController({
    required String email,
    required String password,
  }) async {
    loading.value = true;

    AuthResult authResult = await authRepository.signInRepository(
      email: email,
      password: password,
    );

    loading.value = false;

    authResult.when(
      success: (authModel) {
        this.authModel = authModel;
        utilServices.storeToken(authModel: authModel);
        update();
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {
        bottomSheet(
          message: message,
          height: 330,
          onPressed: () => Get.back(),
        );
      },
    );
  }

  Future<void> signOutController() async {
    Get.delete<TransactionController>();

    utilServices.deleteStoradToken();

    Get.toNamed(AppRoutes.onboardingRoute);
  }

  Future<void> passwordUpdateController({
    required String newPassword,
  }) async {
    String? token = await utilServices.getStoredToken();

    AuthResult authResult = await authRepository.passwordUpdateRepository(
      token: token!,
      newPassword: newPassword,
    );

    authResult.when(
      success: (authModel) {
        // Realizar ação
      },
      error: (message) async {
        // Mensagem de erro
      },
    );
  }

  Future<void> checkTokenController() async {
    String? token = await utilServices.getStoredToken();

    if (token == null) {
      Get.toNamed(AppRoutes.onboardingRoute);
      return;
    }

    AuthResult authResult = await authRepository.checkTokenRepository(token);

    authResult.when(
      success: (authModel) {
        this.authModel = authModel;
        utilServices.storeToken(authModel: authModel);
        update();
        Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {
        // Mensagem de erro
        Get.toNamed(AppRoutes.onboardingRoute);
      },
    );
  }
}
