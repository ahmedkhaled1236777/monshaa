import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/features/reciept/data/models/recieptmodel/recieptmodel.dart';
import 'package:aplication/features/reciept/data/models/recieptmodelrequest.dart';
import 'package:aplication/features/reciept/data/repos/recieptrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class recieptrepoimplementation extends recieptrepo {
  @override
  Future<Either<failure, String>> addreciept(
      {required String token,
      required recieptsmodelrequest reciept,
      required int id}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: "/receipt/create/${id}", token: token, data: reciept.tojson());
      print(response);
      if (response.statusCode == 200 && response.data["status"] == true) {
        return right(response.data["message"]);
      }
      if (response.statusCode == 200 && response.data["code"] == 422) {
        return left(requestfailure(error_message: response.data[0]));
      } else {
        return left(requestfailure(error_message: response.data[0]));
      }
    } catch (e) {
      if (e is DioException) return left(requestfailure.fromdioexception(e));
      return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Recieptmodel>> getreciepts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Recieptmodel recieptmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/receipt/get-all-receipts?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        recieptmodel = Recieptmodel.fromJson(response.data);
        return right(recieptmodel);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deletereciept(
      {required String token, required int recieptid}) async {
    try {
      Response response = await Deletedata.deletedata(
          path: "/receipt/delete/${recieptid}", token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(
            requestfailure(error_message: response.data["data"]["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  /* @override
  Future<Either<failure, String>> editreciept(
      {required String token,
      required int id,
      required recieptsmodelrequest recieptmodel}) async {
    try {
      Response response = await Postdata.postdata(
          path: "/reciepts/update/${id}",
          data: recieptmodel.tojson(),
          token: token);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        return right(response.data["message"]);
      } else if (response.statusCode == 200 && response.data["code"] == 409) {
        return left(requestfailure(error_message: response.data["message"]));
      } else
        return left(requestfailure(error_message: response.data["message"]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }*/
}
