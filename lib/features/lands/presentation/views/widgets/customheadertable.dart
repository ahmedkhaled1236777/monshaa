import 'package:aplication/core/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customheadertableland extends StatelessWidget {
  int flex;
  String? tabletormobile;
  final String title;
  final TextStyle textStyle;
  customheadertableland(
      {this.flex = 3,
      required this.title,
      this.tabletormobile,
      required this.textStyle});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
