// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/auth/register/data/models/registermodel/registermodel.dart';
import 'package:aplication/features/auth/register/data/models/registermodelrequest.dart';
import 'package:aplication/features/auth/register/data/repos/registerrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class registerrepoimplementation extends registerrepo {
  @override
  Future<Either<failure, Registermodel>> register(
      {required registerrequest registerrequest}) async {
    Registermodel registermodel;
    try {
      Response response = await Postdata.postdata(
          path: urls.register, data: registerrequest.tojson());
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم إضافة بيانات الشركة والمدير العام بنجاح") {
        registermodel = Registermodel.fromJson(response.data);
        return right(registermodel);
      } else {
        return left(requestfailure(error_message: response.data["data"][0]));
      }
      // ignore: curly_braces_in_flow_control_structures
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
