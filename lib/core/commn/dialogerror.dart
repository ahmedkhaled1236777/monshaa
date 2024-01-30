  import 'package:flutter/material.dart';

void dialogerror(BuildContext context,{required String error}) {
             showDialog(context: context, builder: ((context) {
      return AlertDialog(actions: [
        SizedBox(height: 25,),
    Center(child: Text(error),),
    SizedBox(height: 40,),
    Center(
      child: ElevatedButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text("تم")),
    )
      ],);
    }));
  }

