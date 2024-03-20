import 'dart:ffi';

import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:flutter/material.dart';

class custommytextform extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  bool obscureText;
  Widget? suffixIcon;
  String? val;
  TextInputType keyboardType;
  int? maxlines;
  bool? readonly;
  String? suffixtext;

  custommytextform(
      {super.key,
      this.readonly = false,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.maxlines = 1,
      this.val,
      this.suffixtext,
      this.keyboardType = TextInputType.none,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return val;
        }
      },
      obscureText: obscureText,
      readOnly: readonly!,
      keyboardType: keyboardType,
      maxLines: maxlines,
      style: TextStyle(fontFamily: "cairo", fontSize: 15),
      controller: controller,
      decoration: InputDecoration(
          suffixText: suffixtext,
          contentPadding: const EdgeInsets.symmetric(horizontal: 7),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Appsizes.size5),
              borderSide:
                  const BorderSide(color: Appcolors.bluecolor, width: 0.5)),
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: Appstyles.textStyle12),
    );
  }
}
