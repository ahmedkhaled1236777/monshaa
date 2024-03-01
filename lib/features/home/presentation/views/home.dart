import 'dart:math';

import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/desktoplayout.dart';
import 'package:aplication/features/home/presentation/views/widgets/mobilelayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    if (BlocProvider.of<HomeCubit>(context).drawerpermessions.isEmpty)
      BlocProvider.of<HomeCubit>(context)
          .getdrawer(permessions: cashhelper.getdata(key: "permessions"));
    if (BlocProvider.of<HomeCubit>(context).gridpermessions.isEmpty)
      BlocProvider.of<HomeCubit>(context)
          .getgrid(permessions: cashhelper.getdata(key: "permessions"));
  }

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<HomeCubit>(context).drawerpermessions);
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
