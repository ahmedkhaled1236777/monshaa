import 'package:aplication/features/auth/login/presentation/views/widgets/desktoplayout.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/mobilelayout.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class loginbody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth >= 600) {
                return Desktoplayout();
              } else {
                return Mobilelayout();
              }
            },
          ),
        ));
  }
}
