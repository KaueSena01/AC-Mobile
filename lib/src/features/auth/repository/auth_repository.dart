import 'package:atlas_coins/src/services/endpoints.dart';
import 'package:atlas_coins/src/services/http_menager.dart';
import 'package:atlas_coins/src/features/auth/model/auth_model.dart';
import 'package:atlas_coins/src/features/auth/result/auth_result.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final auth = AuthModel.fromJson(result['result']);
      return AuthResult.success(auth);
    } else {
      return AuthResult.error(result['error']);
    }
  }

  Future<AuthResult> checkTokenRepository(String token) async {
    final authResult = await _httpManager.restRequest(
      url: EndPoints.checktoken,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return handleUserOrError(authResult);
  }

  Future<AuthResult> signInRepository({
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> signUpRepository({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.register,
      method: HttpMethods.post,
      body: {
        'username': name,
        'email': email,
        'password': password,
      },
    );

    return handleUserOrError(result);
  }

  Future<AuthResult> passwordUpdateRepository({
    required String token,
    required String newPassword,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.updatePassword,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'password': newPassword,
      },
    );

    return handleUserOrError(result);
  }
}
