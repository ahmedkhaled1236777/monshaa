import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/emplyeesearch.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/customaddtenant.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/customtabletenant.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/tenantsearch.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktoptenents extends StatelessWidget {
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
              'المستاجرين',
              style: TextStyle(color: Colors.white, fontSize: 4.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<TenantCubit>(context).queryParameters =
                        null;
                    BlocProvider.of<TenantCubit>(context)
                        .getalltenants(token: generaltoken, page: 1);
                  },
                  icon: Icon(Icons.data_exploration,
                      color: Appcolors.whitecolor)),
              Row(
                children: [
                  tenantsearch(),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.print,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
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
                addtenant(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtabletenants((MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
