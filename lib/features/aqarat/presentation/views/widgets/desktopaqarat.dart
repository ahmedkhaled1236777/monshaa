import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';

import 'package:aplication/features/aqarat/presentation/views/widgets/addaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/desktopdrawer.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/search.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class desktopaqarat extends StatefulWidget {
  @override
  State<desktopaqarat> createState() => _desktopaqaratState();
}

class _desktopaqaratState extends State<desktopaqarat> {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
              'العقارات',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ShowaqaratCubit>(context)
                            .queryParameters = null;
                        BlocProvider.of<ShowaqaratCubit>(context).data.clear();
                        BlocProvider.of<ShowaqaratCubit>(context)
                            .getallaqarat(token: generaltoken, page: 1);
                      },
                      icon: Icon(Icons.blur_circular_rounded,
                          color: Appcolors.whitecolor)),
                  search(),
                  const SizedBox(
                    width: Appsizes.size10,
                  ),
                ],
              )
            ],
          ),
          drawer: Dashboard(),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addaqar(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableaqar((MediaQuery.of(context).size.width * 0.70))
              ],
            ),
          )),
    );
  }
}
