import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/auth/profile/data/model/profilemodel/profilemodel.dart';
import 'package:dartz/dartz.dart';

abstract class profilerepo{
  Future<Either<failure,Profilemodel>>getprofile({required String token});
}