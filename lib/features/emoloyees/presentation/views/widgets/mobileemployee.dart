import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/addaqarwithscaffold.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/addemployee.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/addemployeewithscafold.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/customtableemployees.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/emplyeesearch.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/pdt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobileemployee extends StatelessWidget {
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
                'الموظفين',
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
                          BlocProvider.of<showemployeescuibt>(context)
                              .employeesdata
                              .clear();
                          BlocProvider.of<showemployeescuibt>(context)
                              .getallemployees(token: generaltoken, page: 1);
                        },
                        icon: Icon(
                          Icons.data_exploration,
                          color: Appcolors.whitecolor,
                        )),
                    emplyeesearch(),
                    const SizedBox(
                      width: Appsizes.size5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: Appsizes.size5,
                    ),
                    InkWell(
                      onTap: () {
                        navigateto(
                            navigationscreen: PdfView(
                              titles: 'الموظفيم',
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
                      width: Appsizes.size5,
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateandfinish(
                    navigationscreen: addemployeewithscafold(),
                    context: context);
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
                customtableemployees(MediaQuery.sizeOf(context).width)
              ],
            )),
      );
    });
  }
}
