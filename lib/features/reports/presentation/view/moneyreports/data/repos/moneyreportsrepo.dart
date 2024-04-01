import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/expenses.dart/data/models/expensemodel/expensemodel.dart';
import 'package:dartz/dartz.dart';

abstract class showmoneyreporeports {
  Future<Either<failure, Expensemodel>> showmoney(
      {required String token,
      required int page,
      Map<String, dynamic>? queryParameters});
}
