import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiBaseUrl =  dotenv.get("APIBASEURL", fallback: "");

abstract class EndPoints {

  static String signin = '$apiBaseUrl/login';
  static String register = '$apiBaseUrl/register';
  static String checktoken = '$apiBaseUrl/checktoken';
  static String listtransactions = '$apiBaseUrl/listtransactions';
  static String createtransaction = '$apiBaseUrl/createtransaction';
  static String updatePassword = '$apiBaseUrl/editpassword';

}