import 'package:aplication/features/aqarat/presentation/views/estate.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/desktoptenants.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/mobiletenants.dart';
import 'package:aplication/main.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/readtenants.dart';
import 'package:aplication/showtenants.dart';
import 'package:flutter/material.dart';

import '../../../../../building.dart';

class Tenants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TenantsState();
  }
}

class TenantsState extends State<Tenants> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate1 = DateTime.now();
  var date1 = 'التاريخ';
  var date2 = 'اضغط لاختيار تاريخ محدد';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoptenents();
      } else {
        return mobiletenants();
      }
    });
  }
}
