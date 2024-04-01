import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/revenus/data/model/revenumodel/revenumodel.dart';
import 'package:dartz/dartz.dart';

abstract class showrevenusreporeports {
  Future<Either<failure, Revenumodel>> showrevenus(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
