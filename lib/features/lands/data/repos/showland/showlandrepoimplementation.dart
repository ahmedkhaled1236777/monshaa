import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/features/aqarat/data/models/showstate/showstate.dart';
import 'package:aplication/features/aqarat/data/repos/showaqar/showaqarrepo.dart';
import 'package:aplication/features/lands/data/models/showlands/showlands.dart';
import 'package:aplication/features/lands/data/repos/showland/showlandrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class showlandsrepoimplementation extends showlandsrepo {
  @override
  Future<Either<failure, Showlands>> showlands(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Showlands showlands;
    try {
      Response response = await Getdata.getdata(
          path: "/land/all-lands?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم الحصول على بيانات جميع الاراضي بنجاح") {
        showlands = Showlands.fromJson(response.data);
        return right(showlands);
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      print(e.toString());
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, String>> deleteland(
      {required String token, required int landnumber}) async {
    try {
      Response response = await Deletedata.deletedata(
          path: "/land/delete/${landnumber}", token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم حذف بيانات الارض  بنجاح")
        return right("تم حذف البيانات بنجاح");
      else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
