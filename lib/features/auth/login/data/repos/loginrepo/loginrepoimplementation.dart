import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/auth/login/data/models/login_model/login_model.dart';
import 'package:aplication/features/auth/login/data/models/login_model/loginrequest.dart';
import 'package:aplication/features/auth/login/data/repos/loginrepo/loginrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

// ignore: camel_case_types
class login_repo_implementation extends loginrepo {
  @override
  // ignore: non_constant_identifier_names
  Future<Either<failure, LoginModel>> login(
      {required loginrequest login}) async {
    LoginModel loginModel;
    try {
      var response = await Postdata.postdata(
          path: urls.login,
          data: login.toJson());
      if (response.statusCode == 200 &&
          response.data["message"] == "تم تسجيل دخول المدير بنجاح") {
        loginModel = LoginModel.fromJson(response.data);
        return right(loginModel);
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}