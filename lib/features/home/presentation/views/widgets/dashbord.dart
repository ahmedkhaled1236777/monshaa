import 'dart:math';

import 'package:aplication/building.dart';
import 'package:aplication/catch_receipt.dart';
import 'package:aplication/connect.dart';
import 'package:aplication/contract.dart';
import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/estate.dart';
import 'package:aplication/expense.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/home.dart';
import 'package:aplication/features/auth/login/presentation/views/login.dart';
import 'package:aplication/features/home/presentation/views/widgets/appbartittle.dart';
import 'package:aplication/features/home/presentation/views/widgets/customdraweitem.dart';
import 'package:aplication/main.dart';
import 'package:aplication/readbuild.dart';
import 'package:aplication/readcatch.dart';
import 'package:aplication/readcontract.dart';
import 'package:aplication/readestate.dart';
import 'package:aplication/readexpense.dart';
import 'package:aplication/readreceipt.dart';
import 'package:aplication/readtenants.dart';
import 'package:aplication/receipt.dart';
import 'package:aplication/reports.dart';
import 'package:aplication/tenants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, conters) {
      if (MediaQuery.sizeOf(context).width <675) {
        return   Container(
          child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Color(0xff415769),
              child: 
                    Container(
                      width: MediaQuery.of(context).size.width * 0.18,
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                        
      appbartittle(sizedboxwidth:  Appsizes.size10.w,logo: "images/logo.png", name: "شركة الاتقان",fontSize:20.sp.clamp(0, 20.sp) ,),
                    SizedBox(
                      height: 20.h,
                    ),
                   Column(children: BlocProvider.of<HomeCubit>(context).drawer.map((e) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       customdraweritem(sizedboxwidth: 6.w,textstyle: TextStyle(fontSize: 15.sp.clamp(0, 15.sp),color: Appcolors.whitecolor),iconData: e["icon"], text: e["name"], onTap: (){navigateandfinish(navigationscreen: e["page"], context: context);}, iconsize: 30.sp),
                       SizedBox(height: 20.h,)
                     ],
                   )).toList(),)
                    
                  ],
                ),
              )),
        );
       
      } else {
       return   Container(
          child: Drawer(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Color(0xff415769),
              width: MediaQuery.of(context).size.width * 0.25,
              child: Container(
                child: ListView(
                  children: [
                  
                appbartittle(sizedboxwidth:  Appsizes.size5.w,logo: "images/logo.png", name: "شركة الاتقان",fontSize:6.sp ,),
                    SizedBox(
                      height: 2.h,
                    ),
                   Column(children: BlocProvider.of<HomeCubit>(context).drawer.map((e) => Column(
                     children: [
                       customdraweritem(sizedboxwidth: 3.w,textstyle: Appstyles.textStyle13w,iconData: e["icon"], text: e["name"], onTap: (){navigateandfinish(navigationscreen: e["page"], context: context);}, iconsize: 10.sp.clamp(0, 10.sp)),
                     SizedBox(height: Appsizes.size10.h,)
                     ],
                   )).toList(),)
                  ],
                ),
              )),
        );
      }
    });
  }
}
