import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:dartz/dartz.dart';

abstract class aqarrepo {
  Future<Either<failure, String>> addaqar(
      {required addaqarrequest myaddaqarrequest, required String token});
}
