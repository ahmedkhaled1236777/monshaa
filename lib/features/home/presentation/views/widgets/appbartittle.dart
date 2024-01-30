import 'package:aplication/core/sizes/appsizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class appbartittle extends StatelessWidget {
  final String logo;
  final String name;
  final double fontSize;
  final double sizedboxwidth;
  const appbartittle(
      {super.key,
      required this.logo,
      required this.sizedboxwidth,
      required this.name,
      required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(logo),
        ),
        SizedBox(
          width: sizedboxwidth,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ],
    );
  }
}
