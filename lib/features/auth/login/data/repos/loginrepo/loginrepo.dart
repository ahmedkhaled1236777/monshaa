import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/auth/login/data/models/loginmodel/loginmodel.dart';
import 'package:aplication/features/auth/login/data/models/loginrequest.dart';
import 'package:dartz/dartz.dart';

// ignore: camel_case_types
abstract class loginrepo {
  Future<Either<failure, Loginmodel>> login({required loginrequest login});
}
