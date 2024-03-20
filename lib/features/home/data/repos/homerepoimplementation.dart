import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/home/data/model/homemodel/homemodel.dart';
import 'package:aplication/features/home/data/repos/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class homerepoimplementation extends homerepo {
  @override
  Future<Either<failure, Homemodel>> gethome({required String token}) async {
    try {
      Homemodel home;
      var response = await Getdata.getdata(path: urls.home, token: token);
      if (response.statusCode == 200 && response.data["status"] == true) {
        home = Homemodel.fromJson(response.data);
        return right(home);
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
