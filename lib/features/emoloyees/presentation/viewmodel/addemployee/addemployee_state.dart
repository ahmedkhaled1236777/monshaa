part of 'addemployee_cubit.dart';

abstract class AddemployeeState {}

class AddemployeeInitial extends AddemployeeState {}

class changeprofileimage extends AddemployeeState {}

class Addemployeeloading extends AddemployeeState {}

class Addemployeesuccess extends AddemployeeState {
  final String succes_message;

  Addemployeesuccess({required this.succes_message});
}

class Addemployeefailure extends AddemployeeState {
  final String error_message;

  Addemployeefailure({required this.error_message});
}
