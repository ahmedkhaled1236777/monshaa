import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customappbaractions extends StatelessWidget{
  final void Function() onTapnotific;
  final void Function() onTapmessage;

  const customappbaractions({super.key, required this.onTapnotific, required this.onTapmessage});
  @override
  Widget build(BuildContext context) {
   return  Row(
                  children: [
                    InkWell(
                      onTap: onTapnotific,
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: onTapmessage,
                      child: const Icon(
                        Icons.message,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),]);
  }

}