import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/reports/presentation/view/profitsreports/data/model/profitmodel/profitmodel.dart';
import 'package:dartz/dartz.dart';

abstract class showprofitreporeports {
  Future<Either<failure, Profitmodel>> showprofit(
      {required String token, Map<String, dynamic>? queryParameters});
}
