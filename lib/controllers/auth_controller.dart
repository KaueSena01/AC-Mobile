
import 'package:atlas_coins/repositories/auth_repository.dart';
import 'package:atlas_coins/results/auth_result.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  AuthRepository authRepository = AuthRepository();
  RxBool loading = false.obs;

  Future<AuthResult> login({
    required String email,
    required String password
  }) async {
    loading.value = true;

    AuthResult result = await authRepository.login(
      email: email, 
      password: password
    );

    loading.value = false;

    return result;
  }

}