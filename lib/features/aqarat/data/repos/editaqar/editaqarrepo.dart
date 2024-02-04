import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/aqarat/data/models/addaqarrequest/addaqarrequest.dart';
import 'package:dartz/dartz.dart';

abstract class editaqarrepo{
  Future<Either<failure,String>>editaqar({required String token,required int id,required addaqarrequest add_aqar});
}