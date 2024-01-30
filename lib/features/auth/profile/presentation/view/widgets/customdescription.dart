import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/auth/profile/presentation/view/widgets/customtext.dart';
import 'package:flutter/material.dart';

class customdescription extends StatelessWidget {
  final String description;
  final String value;

  const customdescription(
      {super.key, required this.description, required this.value});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.sizeOf(context).height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Appcolors.maincolor,
            borderRadius: BorderRadius.circular(Appsizes.size10)),
        child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(children: [
                  customtext(text: value),
                  const customtext(text: " : "),
                  customtext(text: description),
                  const SizedBox(
                    width: Appsizes.size15,
                  )
                ]))));
  }
}
