

import 'package:aplication/features/home/presentation/views/widgets/desktoplayout.dart';
import 'package:aplication/features/home/presentation/views/widgets/mobilelayout.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatelessWidget {
  
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoplayout();
      } else {
        return mobilelayout();
      }
    });
  }
}
