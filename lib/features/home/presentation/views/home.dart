

import 'dart:math';

import 'package:aplication/features/home/presentation/views/widgets/desktoplayout.dart';
import 'package:aplication/features/home/presentation/views/widgets/mobilelayout.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(  MediaQuery.of(context).size.width);

    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth <675 ) {
        return mobilelayout();
      } else {
        return   desktoplayout();

      }
    });
  }
}
