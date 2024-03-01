import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:aplication/features/emoloyees/data/models/employeesmodel/employeesmodel.dart';
import 'package:aplication/features/tenants/data/model/tenantmodel/tenantmodel.dart';
import 'package:dartz/dartz.dart';

abstract class employeerepo {
  Future<Either<failure, String>> addemployee(
      {required String token, required addemployeemodel employee});
  Future<Either<failure, Employeesmodel>> getemployees(
      {required String token, required int page});
  Future<Either<failure, String>> deleteemployee(
      {required String token, required int employeenumber});
  Future<Either<failure, String>> edittenant(
      {required String token,
      required int id,
      required Tenantmodel tenantmodel});
}
