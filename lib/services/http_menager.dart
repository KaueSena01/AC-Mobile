import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String delete = 'DELETE';
  static const String patch = 'PATCH';
}

class HttpManager {

  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body
    }) async {
 
    final defaultHeaders = headers?.cast<String, String>() ?? {}..addAll(
      {
      }
    );

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method
        ),
        data: body
      );

      return response.data;
    } on DioError catch(error) {
 
      return error.response?.data ?? {};
    } catch (error) {
 
      return {};
    }
  }
}