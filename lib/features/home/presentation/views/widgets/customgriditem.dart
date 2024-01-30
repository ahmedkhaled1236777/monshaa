import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customgriditem extends StatelessWidget {
  final double textfontsize;
  final double imagewidth;

  final String image;
  final void Function() onTap;
  final int count;
  final String name;

  const customgriditem(
      {super.key,
      required this.image,
      required this.imagewidth,
      required this.textfontsize,
      required this.onTap,
      required this.count,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Appcolors.whitecolor,
            border: Border.all(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.fill,
              width: imagewidth,
            ),
            SizedBox(
              height: 5.w,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: textfontsize, fontWeight: FontWeight.w300),
                ),
                Expanded(
                  child: Text(count.toString(),
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: textfontsize, fontWeight: FontWeight.w300)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
