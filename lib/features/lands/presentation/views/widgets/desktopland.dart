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
import 'package:aplication/features/lands/presentation/viewmodel/showlands/showlands_cubit.dart';
import 'package:aplication/features/lands/presentation/views/widgets/addland.dart';
import 'package:aplication/features/lands/presentation/views/widgets/customtableland.dart';
import 'package:aplication/features/lands/presentation/views/widgets/searchland.dart';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class desktopland extends StatefulWidget {
  @override
  State<desktopland> createState() => _desktoplandState();
}

class _desktoplandState extends State<desktopland> {
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
              'الاراضي',
              style: TextStyle(color: Colors.white, fontSize: 4.sp),
            ),
            centerTitle: true,
            backgroundColor: Color(0xff415769),
            actions: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        BlocProvider.of<ShowlandsCubit>(context).data.clear();
                        BlocProvider.of<ShowlandsCubit>(context)
                            .queryParameters = null;
                        BlocProvider.of<ShowlandsCubit>(context)
                            .getallalands(token: generaltoken, page: 1);
                      },
                      icon: Icon(Icons.data_exploration,
                          color: Appcolors.whitecolor)),
                  landsearch(),
                  const SizedBox(
                    width: Appsizes.size15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: Appsizes.size15,
                  ),
                  InkWell(
                    onTap: () {
                      navigateto(
                          navigationscreen: PdfView(
                            titles: 'الاراضي',
                          ),
                          context: context);
                    },
                    child: const Icon(
                      Icons.print,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: Appsizes.size10,
                  ),
                ],
              )
            ],
          ),
          drawer: desktopdrawer(),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addland(
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableland((MediaQuery.of(context).size.width * 0.70))
              ],
            ),
          )),
    );
  }
}
