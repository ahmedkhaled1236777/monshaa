import 'package:aplication/features/financial/presentation/view/customtableallfinancials.dart';
import 'package:aplication/features/financial/presentation/view/mobilecustomfinancial.dart';
import 'package:flutter/material.dart';

class allfinancials extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allfinancialsState();
  }
}

class allfinancialsState extends State<allfinancials> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtableallfinancials();
      } else {
        return customtableallmobilefinancials();
      }
    });
  }
}
