import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/aqarat/data/models/showstate/showstate.dart';
import 'package:aplication/features/lands/data/models/showlands/showlands.dart';
import 'package:dartz/dartz.dart';

abstract class showlandsrepo {
  Future<Either<failure, Showlands>> showlands(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
  Future<Either<failure, String>> deleteland(
      {required String token, required int landnumber});
}
