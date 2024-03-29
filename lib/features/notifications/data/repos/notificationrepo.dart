import 'package:aplication/core/errors/failure.dart';
import 'package:aplication/features/notifications/data/models/notificationsmodel/notificationsmodel.dart';
import 'package:dartz/dartz.dart';

abstract class notificationsrepo {
  Future<Either<failure, Notificationsmodel>> getnotifications(
      {required String token, required int page});
}
