import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:aplication/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:aplication/features/home/presentation/views/widgets/customdraweitem.dart';
import 'package:aplication/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class desktoplayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<HomeCubit>(context).drawerpermessions);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: appbartittle(
            sizedboxwidth: Appsizes.size5.w,
            logo: "images/logo.png",
            name: "شركة الاتقان",
            fontSize: 5.sp,
          ),
          leading: const Text(''),
          leadingWidth: 0,
          titleSpacing: 10,
          backgroundColor: Appcolors.maincolor,
          actions: [
            customappbaractions(
              onTapmessage: (() {}),
              onTapnotific: (() {}),
            )
          ],
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.15,
              padding: const EdgeInsets.all(10),
              color: Appcolors.maincolor,
              child: ListView(
                  children: BlocProvider.of<HomeCubit>(context)
                      .drawerpermessions
                      .map((e) => Column(
                            children: [
                              customdraweritem(
                                  sizedboxwidth: 3.w,
                                  textstyle: Appstyles.textStyle13w,
                                  iconsize: 6.w,
                                  iconData: e["icon"],
                                  text: e["name"],
                                  onTap: () {
                                    navigateto(
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
                            image: e["image"],
                            onTap: () {
                              navigateto(
                                  navigationscreen: e["page"],
                                  context: context);
                            },
                            count: e["count"],
                            name: e["name"]))
                        .toList()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
