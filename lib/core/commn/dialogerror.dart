import 'dart:async';

import 'package:aplication/core/color/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void dialogerror(BuildContext context, {required String error}) {
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actions: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(error),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("تم")),
            )
          ],
        );
      }));
}

awsomdialogerror(
    {required BuildContext context,
    required String tittle,
    required void Function() btnOkOnPress}) {
  showDialog(
      context: context,
      builder: ((context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              content: SizedBox(
                width: MediaQuery.sizeOf(context).width > 950
                    ? MediaQuery.sizeOf(context).width * 0.25
                    : MediaQuery.sizeOf(context).width > 650
                        ? MediaQuery.sizeOf(context).width * 0.55
                        : MediaQuery.sizeOf(context).width,
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tittle,
                      style: const TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "الغاء",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Color.fromARGB(255, 37, 163, 42)),
                              ),
                              onPressed: btnOkOnPress,
                              child: const Text(
                                "تاكيد",
                                style: TextStyle(fontSize: 12, color: Colors.white),
                                textAlign: TextAlign.center,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
                          Positioned(child: CircleAvatar(radius: 40,backgroundColor: Colors.white,child: CircleAvatar(radius: 38,backgroundColor: Colors.amber,child: Text("!",style: TextStyle(fontSize: 40,color: Colors.white),),),),top:( MediaQuery.sizeOf(context).height-100)/2-70,)

          ],
        );
      }));

  /* AwesomeDialog(
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
            ).show();*/
}
