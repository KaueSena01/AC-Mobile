import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiBaseUrl = dotenv.get("APIBASEURL", fallback: "");

abstract class EndPoints {
  static String signin = '$apiBaseUrl/sign-in';
  static String register = '$apiBaseUrl/create-user';
  static String checktoken = '$apiBaseUrl/validete-token';
  static String listtransactions = '$apiBaseUrl/list-transactions';
  static String createtransaction = '$apiBaseUrl/create-transaction';
  static String updatePassword = '$apiBaseUrl/editpassword';
}
