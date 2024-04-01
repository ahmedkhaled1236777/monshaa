import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/connect/data/model/connectmodelrequest.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

abstract class connectrepo {
  Future<Either<failure, String>> addmessage(
      {required String token, required connectmodelrequest connect});
}
