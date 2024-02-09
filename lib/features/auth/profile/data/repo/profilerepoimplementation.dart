import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/auth/profile/data/model/profilemodel/profilemodel.dart';
import 'package:aplication/features/auth/profile/data/repo/profilerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class profilerepoimplementation extends profilerepo {
  @override
  Future<Either<failure, Profilemodel>> getprofile(
      {required String token}) async {
    Profilemodel profilemodel;
    try {
      Response response =
          await Getdata.getdata(path: urls.get_profile, token: token);
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم الحصول على بيانات بروفايل الشركه بنجاح") {
        profilemodel = Profilemodel.fromJson(response.data);
        return right(profilemodel);
      } else {
        return left(requestfailure(error_message: response.data["message"]));
      }
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }
}
