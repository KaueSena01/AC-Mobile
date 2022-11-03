const String apiBaseUrl = 'http://localhost:3000/atlascoins';

abstract class EndPoints {

  static const String signin = '$apiBaseUrl/login';
  static const String register = '$apiBaseUrl/register';
  static const String checktoken = '$apiBaseUrl/checktoken';
  static const String listtransactions = '$apiBaseUrl/listtransactions';
  static const String createtransaction = '$apiBaseUrl/createtransaction';
  static const String updatePassword = '$apiBaseUrl/editpassword';

}