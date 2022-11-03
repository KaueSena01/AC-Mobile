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
      return AuthResult.error('Ocorreu um erro inesperado!');
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.checktoken, 
      method: HttpMethods.post,
      headers: {
        'Authorization': 'Bearer ' + token
    });

    return handleUserOrError(result);
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

  Future<AuthResult> register(
    { 
      required String name,  
      required String email, 
      required String password 
    }
  ) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.register,
      method: HttpMethods.post,
      body: {
        'name': name,
        'email': email,
        'password': password
      }
    );

    return handleUserOrError(result); 
  }

  Future<AuthResult> updatePassword(
    { 
      required String token,
      required String newPassword
    }
  ) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.updatePassword,
      method: HttpMethods.post,
      headers: {
        'Authorization': 'Bearer ' + token
      },
      body: {
        'password': newPassword, 
      }
    );

    return handleUserOrError(result); 
  }
  
}