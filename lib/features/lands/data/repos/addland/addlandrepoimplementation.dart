import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/repos/addaqar/aqar.dart';
import 'package:aplication/features/lands/data/models/addlandrequestmodel.dart';
import 'package:aplication/features/lands/data/repos/addland/addlandrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class addlandrepoimplementation extends landrepo {
  @override
  Future<Either<failure, String>> addland(
      {required addlandrequest addlandrequest, required String token}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.add_land, data: addlandrequest.tojson(), token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم اضافه البيانات بنجاح") {
        print(response.data);
        return right("تمت اضافة البيانات بنجاح");
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
    } catch (e) {
      print(e);
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }
}
