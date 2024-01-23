import 'package:aplication/core/styles/style.dart';
import 'package:flutter/material.dart';

class customtext extends StatelessWidget{
  final String text;

  const customtext({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
   return Text(text,style:Appstyles.textStyle15 ,);
  }

}