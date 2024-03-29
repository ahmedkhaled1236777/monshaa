import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/lands/data/models/showlands/showlands.dart';
import 'package:dartz/dartz.dart';

abstract class showlandreporeports {
  Future<Either<failure, Showlands>> showland(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
