import 'package:aplication/features/aqarat/presentation/views/widgets/desktopaqarat.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/mobileaddaqqar.dart';

import 'package:flutter/material.dart';

class Estate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EstateState();
  }
}

class EstateState extends State<Estate> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth > 950)
        return desktopaqarat();
      else {
        return mobiladdaqaar();
      }
    });
  }
}
