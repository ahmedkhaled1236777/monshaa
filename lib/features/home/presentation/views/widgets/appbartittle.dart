import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/widgets/cashedimage.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class appbartittle extends StatelessWidget {
  final double fontSize;
  final double sizedboxwidth;
  const appbartittle(
      {super.key, required this.sizedboxwidth, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        cashhelper.getdata(key: "logo") == null
            ? CircleAvatar(
              radius: 25,
                backgroundImage: AssetImage("images/logo.png"),
              )
            : imagefromrequest(
                url: cashhelper.getdata(key: "logo"),
                height: 50,
                width: 50,
              ),
        SizedBox(
          width: 0,
        ),
        Text(
          cashhelper.getdata(key: "company_name"),
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ],
    );
  }
}
