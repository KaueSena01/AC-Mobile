import 'package:atlas_coins/models/auth_model.dart';
import 'package:atlas_coins/results/auth_result.dart';
import 'package:atlas_coins/services/endpoints.dart';
import 'package:atlas_coins/services/http_menager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future login(
    { required String email, required String password }
  ) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password
      }
    );
    
    AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    // if (result[''] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    // } else {
      // return AuthResult.error(authError.authErrorsString(result['error']));
    }
  
  }
}