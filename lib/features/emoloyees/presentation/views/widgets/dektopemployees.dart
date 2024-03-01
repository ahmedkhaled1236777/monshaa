import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees_powers.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/addemployee.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/customtableemployeeitem.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/customtableemployees.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/emplyeesearch.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/pdt.dart';
import 'package:aplication/show_employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopemployees extends StatelessWidget {
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          key: scafoldstate,
          backgroundColor: Appcolors.maincolor,
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
              style: TextStyle(color: Colors.white, fontSize: 4.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<showemployeescuibt>(context)
                        .employeesdata
                        .clear();
                    BlocProvider.of<showemployeescuibt>(context)
                        .getallemployees(
                      page: 1,
                      token: generaltoken,
                    );
                  },
                  icon: Icon(Icons.data_exploration,
                      color: Appcolors.whitecolor)),
              Row(
                children: [
                  emplyeesearch(),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PdfView(
                          titles: 'العقارات',
                        );
                      }));
                    },
                    child: const Icon(
                      Icons.print,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 13,
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
                addemplyee(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtableemployees(
                    (MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
