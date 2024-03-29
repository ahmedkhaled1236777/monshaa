import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reciept/presentaion/view/addrecieptwithscafold.dart';
import 'package:aplication/features/reciept/presentaion/view/customtablereciept.dart';
import 'package:aplication/features/reciept/presentaion/view/recieptsearch.dart';
import 'package:aplication/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobilereciepts extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: scafoldstate,
            backgroundColor: Color(0xff415769),
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
              title: Text(
                'سند الصرف',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: constrains.maxWidth > 600 ? 6.sp : 9.sp),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    allrecieptsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                   
                  ],
                )
              ],
            ),
            drawer: Dashboard(),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customtablereciepts(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
