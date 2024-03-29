import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/contracts/data/models/contractmodel/contractmodel.dart';
import 'package:aplication/features/financial/data/model/financialmodel/financialmodel.dart';
import 'package:dartz/dartz.dart';

abstract class finishedcontractrepo {
  Future<Either<failure, Contractmodel>> getcontracts({
    required String token,
    required int page,
  });
  Future<Either<failure, String>> deletecontract(
      {required String token, required int contractid});
}
