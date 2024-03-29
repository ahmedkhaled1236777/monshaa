import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/addtenantwithscafold.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/customtabletenant.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/tenantsearch.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:aplication/pdt.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mobiletenants extends StatelessWidget {
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
                'المستاجرين',
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
                          BlocProvider.of<TenantCubit>(context)
                              .queryParameters = null;

                          BlocProvider.of<TenantCubit>(context)
                              .getalltenants(token: generaltoken, page: 1);
                        },
                        icon: const Icon(
                          Icons.blur_circular_rounded,
                          color: Appcolors.whitecolor,
                        )),
                    tenantsearch(),
                    const SizedBox(
                      width: Appsizes.size10,
                    ),
                  ],
                )
              ],
            ),
            floatingActionButton: AvatarGlow(
              startDelay: const Duration(milliseconds: 1000),
              glowColor: Color(0xffBF4F51),
              glowShape: BoxShape.circle,
              curve: Curves.fastOutSlowIn,
              animate: true,
              child: Material(
                elevation: 8.0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    navigateandfinish(
                        navigationscreen: addtenantwithscafold(),
                        context: context);
                  },
                  backgroundColor: Color(0xffBF4F51),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            drawer: Dashboard(),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customtabletenants(MediaQuery.sizeOf(context).width)],
            )),
      );
    });
  }
}
