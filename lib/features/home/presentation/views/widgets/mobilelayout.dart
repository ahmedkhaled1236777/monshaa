import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/home/presentation/viewmodel/cubit/home_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/customappbaractions.dart';
import 'package:aplication/features/home/presentation/views/widgets/customgriditem.dart';
import 'package:aplication/features/home/presentation/views/widgets/leadinappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobilelayout extends StatelessWidget{
   final GlobalKey<ScaffoldState> scafoldstate= GlobalKey<ScaffoldState> ();

  @override
  Widget build(BuildContext context) {
   return  Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            key: scafoldstate,
            appBar: AppBar(
              backgroundColor:Appcolors.maincolor,
              leading: leadingappbar(scafoldstate: scafoldstate,),
              title: Text(
                'الرئيسية',
                style: Appstyles.textStyle14w,
              ),
              centerTitle: true,
              actions: [
              customappbaractions(onTapnotific: (){}, onTapmessage: (){}),
                              SizedBox(width: 7.w,),

              ],
            ),
            drawer: Dashboard(),
            body: Container(
              padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: BlocProvider.of<HomeCubit>(context).grid.map((e) => customgriditem(imagewidth: 35.w,textfontsize:12.sp ,image: e["image"], onTap: (){
                        navigateto(navigationscreen: e["page"], context: context);
                      }, count: e["count"], name: e["name"])).toList()
              ),
            ),
          ),
        );
  }

}