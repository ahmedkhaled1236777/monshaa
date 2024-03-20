import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/features/financial/data/model/financialmodel/financialmodel.dart';
import 'package:aplication/features/financial/data/model/financialmodelrequest.dart';
import 'package:aplication/features/financial/data/repos/financialrepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class financialrepoimplementation extends financialrepo {
  @override
  Future<Either<failure, String>> addfinancial(
      {required String token,
      required financialmodelrequest financial,
      required int id}) async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      Response response = await Postdata.postdata(
          path: "/cash/create/${id}", token: token, data: financial.tojson());
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
  Future<Either<failure, Financialmodel>> getfinancials(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters}) async {
    Financialmodel financialmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/cash/get-all-cashes?page=${page}",
          token: token,
          queryParameters: queryParameters);
      if (response.statusCode == 200 && response.data["code"] == 200) {
        financialmodel = Financialmodel.fromJson(response.data);
        return right(financialmodel);
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
  Future<Either<failure, String>> deletefinancial(
      {required String token, required int financialid}) async {
    try {
      Response response = await Deletedata.deletedata(
          path: "/cash/delete/${financialid}", token: token);
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
}
