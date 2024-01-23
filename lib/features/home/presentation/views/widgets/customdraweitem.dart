import 'package:aplication/core/styles/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class customdraweritem extends StatelessWidget{
  final IconData iconData;
  final String text;
  final void Function() onTap;
  final double iconsize;
final TextStyle textstyle;
final double sizedboxwidth;
  const customdraweritem({super.key, required this.iconData, required this.sizedboxwidth,required this.textstyle,required this.text,required this.onTap,required this.iconsize});
  @override
  Widget build(BuildContext context) {
   return   InkWell(
                        onTap: onTap,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                         
                            Icon(
                              
                              iconData,
                              color: Colors.white,
                              size: iconsize,
                            ),
                            SizedBox(
                              width:sizedboxwidth,
                            ),
                            Text(
                              text,
                              style: textstyle,
                            )
                          ],
                        )
                      );
  }

}