import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateTime selectedDate = DateTime.now();
  String date1 = "التاريخ";
  String date2 = "التاريخ";
  String date3 = "الايجار من";
  String date4 = "الايجار الي";

  DateTime selectedDate1 = DateTime.now();
  DateCubit() : super(DateInitial());
  changedate(BuildContext context) async {
    emit(newchangedatestate());
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      date1 = '${date.year}-${month}-${date.day}';
    }
    ;
    emit(changedatestate());
  }

  changedate2(BuildContext context) async {
        emit(newchangedatestate());

    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      date2 = '${date.year}-${month}-${date.day}';
    }
    
    emit(changedatestate());
  }
  changedate3(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      date3 = '${date.year}-${month}-${date.day}';
    }
    
    emit(changedatestate());
  }
  changedate4(BuildContext context) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
    if (date != null) {
      selectedDate = date;
      String month = date.month > 9 ? '${date.month}' : '0${date.month}';
      date4 = '${date.year}-${month}-${date.day}';
    }
  
    emit(changedatestate());
  }

  cleardates() {
    date1 = "التاريخ";
    date2 = "التاريخ";
    emit(changedatestate());
  }
}
