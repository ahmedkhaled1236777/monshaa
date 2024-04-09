import 'dart:math';

import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/desktoplayout.dart';
import 'package:aplication/features/home/presentation/views/widgets/mobilelayout.dart';
import 'package:aplication/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  @override
  intializedata() async {
    await BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken);
  }

  void initState() {
    intializedata();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, consters) {
      if (consters.maxWidth >= 950) {
        return desktoplayout();
      } else {
        return mobilelayout(
          tablet_or_mobile: consters.maxWidth > 600 ? "tablet" : "mobile",
        );
      }
    });
  }
}
