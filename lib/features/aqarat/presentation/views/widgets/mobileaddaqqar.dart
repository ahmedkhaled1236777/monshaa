import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/addaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/addaqarwithscaffold.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableaqar.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/desktopdrawer.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/search.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobiladdaqaar extends StatelessWidget {
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
                'العقارات',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: constrains.maxWidth > 600 ? 10.sp : 15.sp),
              ),
              centerTitle: true,
              backgroundColor: Color(0xff415769),
              actions: [
                Row(
                  children: [
                    search(),
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
                              titles: 'العقارات',
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateandfinish(
                    navigationscreen: addaqarwithscafold(), context: context);
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
                customtableaqar(
                  (MediaQuery.of(context).size.width),
                )
              ],
            )),
      );
    });
  }
}
