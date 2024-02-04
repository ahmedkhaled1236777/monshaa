import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/aqarat/data/models/showstate/showstate.dart';
import 'package:dartz/dartz.dart';

abstract class showaqarrepo{
  Future<Either<failure,Showstate>>showaqar({required String token,required int page,    Map<String,dynamic>?queryParameters
});
    Future<Either<failure,String>>deleteaqar({required String token,required int aqarnumber});

}