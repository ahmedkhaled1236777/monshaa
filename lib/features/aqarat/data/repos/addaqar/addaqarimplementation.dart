import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/aqarat/data/models/allemployeesmodel/allemployeesmodel.dart';
import 'package:aplication/features/aqarat/data/repos/addaqar/aqar.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class addaqarimplementation extends aqarrepo {
  @override
  Future<Either<failure, String>> addaqar(
      {required addaqarrequest myaddaqarrequest, required String token}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.add_aqar, data: myaddaqarrequest.tojson(), token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم اضافه البيانات بنجاح") {
        print(response.data);
        return right("تمت اضافة البيانات بنجاح");
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, Allemployeesmodel>> getallemployees(
      {required String token}) async {
    Allemployeesmodel allemployeesmodel;
    try {
      Response response =
          await Getdata.getdata(path: urls.allemployees, token: token);
      if (response.statusCode == 200 && response.data["status"] == true) {
        allemployeesmodel = Allemployeesmodel.fromJson(response.data);
        return right(allemployeesmodel);
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
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
