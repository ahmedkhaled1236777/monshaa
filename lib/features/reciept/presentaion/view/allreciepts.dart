import 'package:aplication/features/reciept/presentaion/view/cuatomtableallreciepts.dart';
import 'package:aplication/features/reciept/presentaion/view/mobilecustomreciept.dart';
import 'package:flutter/material.dart';

class allreciepts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return allrecieptsState();
  }
}

class allrecieptsState extends State<allreciepts> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return customtableallreciepts();
      } else {
        return customtableallmobilereciepts();
      }
    });
  }
}
