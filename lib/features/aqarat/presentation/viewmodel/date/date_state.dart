part of 'date_cubit.dart';

abstract class DateState extends Equatable {
  const DateState();

  @override
  List<Object> get props => [];
}

class DateInitial extends DateState {}

class changedatestate extends DateState {}

class newchangedatestate extends DateState {}
