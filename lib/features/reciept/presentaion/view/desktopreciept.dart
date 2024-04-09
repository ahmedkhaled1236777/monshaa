import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:aplication/features/contracts/presentation/views/contractsearchdialog.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reciept/presentaion/view/addreciept.dart';
import 'package:aplication/features/reciept/presentaion/view/customtablereciept.dart';
import 'package:aplication/features/reciept/presentaion/view/recieptsearch.dart';
import 'package:aplication/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class desktopreciepts extends StatelessWidget {
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
              'سند صرف',
              style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
            ),
            centerTitle: true,
            backgroundColor: Appcolors.maincolor,
            actions: [
              IconButton(
                  onPressed: () async {
                    BlocProvider.of<recieptCubit>(context).queryParameters =
                        null;
                    await BlocProvider.of<recieptCubit>(context)
                        .getallreciepts(token: generaltoken, page: 1);
                  },
                  icon: const Icon(Icons.blur_circular_rounded,
                      color: Appcolors.whitecolor)),
              allrecieptsearch(),
              SizedBox(
                width: 10,
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
                addreciept(
                  formkey: formkey,
                  width: MediaQuery.of(context).size.width * 0.27,
                ),
                customtablereciepts((MediaQuery.of(context).size.width * 0.70)),
              ],
            ),
          )),
    );
  }
}
