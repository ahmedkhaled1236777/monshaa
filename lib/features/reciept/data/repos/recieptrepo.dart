import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/reciept/data/models/recieptmodel/recieptmodel.dart';
import 'package:aplication/features/reciept/data/models/recieptmodelrequest.dart';
import 'package:dartz/dartz.dart';

abstract class recieptrepo {
  Future<Either<failure, String>> addreciept(
      {required String token,
      required recieptsmodelrequest reciept,
      required int id});
  Future<Either<failure, Recieptmodel>> getreciepts(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deletereciept(
      {required String token, required int recieptid});
  /* Future<Either<failure, String>> editreciept(
      {required String token,
      required int id,
      required recieptsmodelrequest recieptmodel});*/
}
