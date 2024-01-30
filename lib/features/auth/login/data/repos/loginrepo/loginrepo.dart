import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/auth/login/data/models/login_model/login_model.dart';
import 'package:aplication/features/auth/login/data/models/login_model/loginrequest.dart';
import 'package:dartz/dartz.dart';

// ignore: camel_case_types
abstract class loginrepo {
  Future<Either<failure, LoginModel>> login({required loginrequest login});
}
