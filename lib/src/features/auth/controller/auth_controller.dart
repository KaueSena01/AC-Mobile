import 'package:atlas_coins/src/components/modal_error.dart';
import 'package:get/get.dart';

import 'package:atlas_coins/src/routes/app_pages.dart';
import 'package:atlas_coins/src/utils/utils_services.dart';
import 'package:atlas_coins/src/features/auth/model/auth_model.dart';
import 'package:atlas_coins/src/features/auth/result/auth_result.dart';
import 'package:atlas_coins/src/features/auth/repository/auth_repository.dart';
import 'package:atlas_coins/src/features/transaction/controller/transaction_controller.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';

class AuthController extends GetxController {
  AuthModel authModel = AuthModel();
  UtilsServices utilServices = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;

  Future<void> signUpController({
    required String name,
    required String email,
    required String password,
  }) async {
    loading.value = true;

    AuthResult authResult = await authRepository.signUpRepository(
      name: name,
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
        bottomSheet(
          message: message,
          height: 330,
          onPressed: () => Get.back(),
        );
      },
    );
  }

  Future<String?> checkTokenController() async {
    String? token = await utilServices.getStoredToken();

    if (token == null) {
      // Get.toNamed(AppRoutes.onboardingRoute);
      return AppRoutes.onboardingRoute;
    }

    AuthResult authResult = await authRepository.checkTokenRepository(token);

    authResult.when(
      success: (authModel) {
        this.authModel = authModel;
        utilServices.storeToken(authModel: authModel);
        update();

        // Get.toNamed(AppRoutes.homeRoute);
      },
      error: (message) async {
        // Get.toNamed(AppRoutes.onboardingRoute);
      },
    );

    return AppRoutes.homeRoute;
  }

  Future<void> checkBiometricController() async {
    String? token = await utilServices.getStoredToken();

    if (token == null) {
      Get.toNamed(AppRoutes.loginRoute);
      return;
    }

    final LocalAuthentication auth = LocalAuthentication();

    try {
      final bool isDeviceSupported = await auth.isDeviceSupported();

      if (!isDeviceSupported) {
        return;
      }

      final bool didAuthenticate = await auth.authenticate(
        localizedReason:
            'Utilize a biometria para uma autenticação rápida e segura',
        options: const AuthenticationOptions(
          biometricOnly: true,
          useErrorDialogs: false,
          sensitiveTransaction: false,
        ),
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Autenticação por biometria',
            biometricHint: '',
            cancelButton: 'Não obrigado',
          ),
          IOSAuthMessages(
            cancelButton: 'Não obrigado',
          ),
        ],
      );

      if (didAuthenticate) {
        checkTokenController();
      } else {
        Get.toNamed(AppRoutes.loginRoute);
      }
    } catch (e) {
      Get.toNamed(AppRoutes.loginRoute);
    }
  }
}
