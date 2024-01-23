import 'package:aplication/core/urls/urls.dart';
import 'package:dio/dio.dart';

class Apiservice {
  static late Dio dio;
  static initdio() {
    dio = Dio(BaseOptions(baseUrl: urls.baseurl));
  }
}

// ignore: camel_case_types
class Postdata {
  static Future<Response> postdata({
    required String path,
    String? token,
    Object? data,
  }) async {
    var respnse = await Apiservice.dio.post(path,
        data: data,
        options: Options(
            headers: {"Accept": "application/json", "Authorization": token}));
    return respnse;
  }
}

// ignore: camel_case_types
class Getdata {
  static Future<Response> getdata({required String path, String? token}) async {
    var respnse = await Apiservice.dio.get(path,
        options: Options(
            headers: {"Accept": "application/json", "Authorization": token}));
    return respnse;
  }
}
