import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/core/errors/handlingerror.dart';
import 'package:aplication/core/services/apiservice.dart';
import 'package:aplication/core/urls/urls.dart';
import 'package:aplication/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:aplication/features/emoloyees/data/models/employeesmodel/employeesmodel.dart';
import 'package:aplication/features/emoloyees/data/repos/addemployeerepo.dart';
import 'package:aplication/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class emplyeerepoimplementaion extends employeerepo {
  @override
  Future<Either<failure, String>> addemployee(
      {required String token, required addemployeemodel employee}) async {
    try {
      Response response = await Postdata.postdata(
          path: urls.add_employee, token: token, data: employee.tojson());
      print(response);
      if (response.statusCode == 422) {}
      if (response.statusCode == 200 &&
          response.data["message"] == "تم اضافه بيانات الموظف بنجاح") {
        return right(response.data["message"]);
      } else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, Employeesmodel>> getemployees(
      {required String token, required int page}) async {
    Employeesmodel employeesmodel;
    try {
      Response response = await Getdata.getdata(
          path: "/employee/get-all-employees?page=${page}", token: token);
      print(response.data);
      if (response.statusCode == 200 &&
          response.data["message"] ==
              "تم جلب جميع الموظفين التابعه للشركه العقاريه بنجاح") {
        employeesmodel = Employeesmodel.fromJson(response.data);
        return right(employeesmodel);
      } else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException)
        return left(requestfailure.fromdioexception(e));
      else
        return left(requestfailure(error_message: e.toString()));
    }
  }

  @override
  Future<Either<failure, String>> deleteemployee(
      {required String token, required int employeenumber}) async {
    try {
      Response response = await Deletedata.deletedata(
          path: "/employee/delete/${employeenumber}", token: token);
      if (response.statusCode == 200 &&
          response.data["message"] == "تم حذف الموظف بنجاح")
        return right("تم حذف البيانات بنجاح");
      else
        return left(requestfailure(error_message: response.data["data"][0]));
    } catch (e) {
      if (e is DioException) {
        return left(requestfailure.fromdioexception(e));
      } else {
        return left(requestfailure(error_message: e.toString()));
      }
    }
  }

  @override
  Future<Either<failure, String>> edittenant(
      {required String token,
      required int id,
      required Tenantmodel tenantmodel}) {
    // TODO: implement edittenant
    throw UnimplementedError();
  }
}
