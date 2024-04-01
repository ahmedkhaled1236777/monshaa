import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void dialogerror(BuildContext context, {required String error}) {
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actions: [
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(error),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("تم")),
            )
          ],
        );
      }));
}
awsomdialogerror({required BuildContext context,required String tittle,required void Function() btnOkOnPress}){
           AwesomeDialog(
                                    width: MediaQuery.sizeOf(context).width>950?MediaQuery.sizeOf(context).width*0.35:
                                     MediaQuery.sizeOf(context).width>650? MediaQuery.sizeOf(context).width*0.55:
                                    
                                    MediaQuery.sizeOf(context).width,
                                  
            context: context,
            dialogType: DialogType.info,
            animType: AnimType.rightSlide,
            title: '',
            desc: tittle,
            btnCancelOnPress: () {
              Navigator.pop(context);
            },
            btnOkOnPress: btnOkOnPress,
            ).show();
}