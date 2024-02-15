import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:aplication/features/lands/data/models/addlandrequestmodel.dart';
import 'package:dartz/dartz.dart';

abstract class landrepo {
  Future<Either<failure, String>> addland(
      {required addlandrequest addlandrequest, required String token});
}
