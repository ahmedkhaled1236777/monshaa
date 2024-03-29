import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/addaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/addaqarwithscaffold.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/desktopdrawer.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/search.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:aplication/features/lands/presentation/views/widgets/addlandswithscaffold.dart';
import 'package:aplication/features/lands/presentation/views/widgets/customtableland.dart';
import 'package:aplication/features/lands/presentation/views/widgets/searchland.dart';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobileland extends StatelessWidget {
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
                'الاراضي',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: constrains.maxWidth > 600 ? 6.sp : 9.sp),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<ShowlandsCubit>(context)
                              .queryParameters = null;
                          BlocProvider.of<ShowlandsCubit>(context).data.clear();
                          BlocProvider.of<ShowlandsCubit>(context)
                              .getallalands(token: generaltoken, page: 1);
                        },
                        icon: Icon(
                          Icons.blur_circular_rounded,
                          color: Appcolors.whitecolor,
                        )),
                    landsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
           
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateandfinish(
                    navigationscreen: addlandwithscafold(), context: context);
              },
              backgroundColor: Color(0xffBF4F51),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            drawer: Dashboard(),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customtableland(
                  (MediaQuery.of(context).size.width),
                )
              ],
            )),
      );
    });
  }
}
