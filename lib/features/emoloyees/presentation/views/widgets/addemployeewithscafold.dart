import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/addemployee.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addemployeewithscafold extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> foemkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
          backgroundColor: Appcolors.maincolor,
          centerTitle: true,
          title: Text(
            "تسجيل موظفين",
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    MediaQuery.sizeOf(context).width > 600 ? 10.sp : 15.sp),
          ),
        ),
        drawer: Dashboard(),
        body: Center(
            child: addemplyee(
          formkey: foemkey,
          width: MediaQuery.sizeOf(context).width * 0.75,
        )),
      ),
    );
  }
}
