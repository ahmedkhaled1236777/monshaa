import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/home/data/model/homemodel/homemodel.dart';
import 'package:dartz/dartz.dart';

abstract class homerepo {
  Future<Either<failure, Homemodel>> gethome({required String token});
}
