import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateTime selectedDate = DateTime.now();
  String date1 = "التاريخ";

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
}
