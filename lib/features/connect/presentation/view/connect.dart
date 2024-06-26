import 'package:aplication/features/connect/presentation/view/desktopconnect.dart';
import 'package:aplication/features/connect/presentation/view/mobileconnect.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';

class Connect extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConnectState();
  }
}

class ConnectState extends State<Connect> {
  String? name;
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          key: scafoldstate,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                scafoldstate.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'تواصل معنا',
              style: TextStyle(color: Colors.white, fontSize: 13.7),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
          ),
          drawer: Dashboard(),
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 1100) {
                return desktopconnect();
              } else {
                return mobileconnect();
              }
            },
          ),
        ));
  }
}
