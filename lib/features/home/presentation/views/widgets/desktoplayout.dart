import 'dart:async';

import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:aplication/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:aplication/features/home/presentation/views/widgets/customdraweitem.dart';
import 'package:aplication/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:aplication/features/notifications/presentations/view/alertnotifications.dart';
import 'package:aplication/features/notifications/presentations/view/mobilenotifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class desktoplayout extends StatefulWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<desktoplayout> createState() => _desktoplayoutState();
}

class _desktoplayoutState extends State<desktoplayout> {
  int x = 0;
  Timer? timer;
  @override
  void initState() {
    if (context.mounted)
      timer = Timer.periodic(
          Duration(seconds: 15),
          (Timer t) =>
              BlocProvider.of<HomeCubit>(context).gethome(token: generaltoken));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: widget.scafoldstate,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: appbartittle(
            sizedboxwidth: Appsizes.size5.w,
            fontSize: 5.sp,
          ),
          leading: const Text(''),
          leadingWidth: 0,
          titleSpacing: 10,
          backgroundColor: Appcolors.maincolor,
          actions: [
            customappbaractions(
              onTapmessage: (() {}),
              onTapnotific: (() {
                showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        title: Container(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.close)),
                        ),
                        content: alernotifications(
                          tablet_or_mobile: "",
                          counter: BlocProvider.of<HomeCubit>(context)
                              .sidebar[12]["count"],
                        ),
                      );
                    }));
              }),
            )
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is Homefailure)
              showsnack(comment: state.error_message, context: context);
          },
          builder: (context, state) {
            if (state is Homeloading)
              return loading();
            else if (state is Homefailure) return SizedBox();

            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  padding: const EdgeInsets.all(10),
                  color: Appcolors.maincolor,
                  child: ListView(
                      children: BlocProvider.of<HomeCubit>(context)
                          .sidebarpermessions
                          .map((e) => Column(
                                children: [
                                  customdraweritem(
                                      count: e["count"],
                                      sizedboxwidth: 3.w,
                                      textstyle: Appstyles.textStyle13w,
                                      iconsize: 6.w,
                                      iconData: e["icon"],
                                      text: e["name"],
                                      onTap: () {
                                        navigateandfinish(
                                            navigationscreen: e["page"],
                                            context: context);
                                      }),
                                  SizedBox(
                                    height: 12.h,
                                  )
                                ],
                              ))
                          .toList()),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 1,
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            childAspectRatio: 1.53,
                            crossAxisSpacing: 5.w,
                            mainAxisSpacing: 5.w),
                        children: BlocProvider.of<HomeCubit>(context)
                            .gridpermessions
                            .map((e) => customgriditem(
                                imagewidth: 12.w,
                                textfontsize: 3.6.sp,
                                image: e.icon!,
                                onTap: () {},
                                count: e.count!.toInt(),
                                name: e.name!))
                            .toList()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }
}
