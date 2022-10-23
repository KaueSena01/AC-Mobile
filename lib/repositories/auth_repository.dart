import 'package:atlas_coins/models/auth_model.dart';
import 'package:atlas_coins/results/auth_result.dart';
import 'package:atlas_coins/services/endpoints.dart';
import 'package:atlas_coins/services/http_menager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final auth = AuthModel.fromJson(result['result']);
      return AuthResult.success(auth);
    } else {
      return AuthResult.error('Ocorreu um erro inesperodo!');
    }
  }

  Future<AuthResult> login(
    { 
      required String email, 
      required String password 
    }
  ) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password
      }
    );

    return handleUserOrError(result);
  
  }
}