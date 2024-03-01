import 'package:aplication/features/expenses.dart/presentation/views/desktopexpense.dart';
import 'package:aplication/features/expenses.dart/presentation/views/mobileexpense.dart';
import 'package:flutter/material.dart';

class expenses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return expensesState();
  }
}

class expensesState extends State<expenses> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'اضغط لاختيار تاريخ محدد';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktopexpenses();
      } else {
        return mobileexpenses();
      }
    });
  }
}
