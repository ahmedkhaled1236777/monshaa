import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeestates.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/customtableemployeeitem.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/showemployeedialog.dart';
import 'package:aplication/show_employees.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableemployees extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableemployees(this.width);

  @override
  State<customtableemployees> createState() => _customtableemployeeesState();
}

class _customtableemployeeesState extends State<customtableemployees> {
  initscroll() async {
    BlocProvider.of<showemployeescuibt>(context).employeesdata.clear();
    await BlocProvider.of<showemployeescuibt>(context)
        .getallemployees(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<showemployeescuibt>(context)
            .getallmoreemployees(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<AddemployeeCubit>(context)
                    .headertable
                    .map((e) => customheadertable(
                        title: e,
                        flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                        textStyle:
                            Appstyles.getheadertextstyle(context: context)))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<showemployeescuibt, showemployeesstates>(
                  listener: (context, state) {
            if (state is showemployeesfailure)
              showsnack(comment: state.error_message, context: context);
          }, builder: (context, state) {
            if (state is showemployeesloading) return loading();
            if (state is showemployeesfailure) return SizedBox();
            return SingleChildScrollView(
              controller: widget.scrollController,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return index >=
                            BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata
                                .length
                        ? loading()
                        : InkWell(
                            onTap: () {
                              navigateto(
                                  navigationscreen: ShowEmployees(),
                                  context: context);
                            },
                            child: showtemployeedialog(
                              index: index,
                              child: customtableemployeeitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  employeename:
                                      BlocProvider.of<showemployeescuibt>(
                                              context)
                                          .employeesdata[index]
                                          .name!,
                                  adress: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .address!,
                                  phone: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .phone!,
                                  job: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .jobTitle!,
                                  delet: IconButton(
                                      onPressed: () async {
                                        await BlocProvider.of<
                                                showemployeescuibt>(context)
                                            .deleteemployee(
                                                token: generaltoken,
                                                employeenumber: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .id!
                                                    .toInt());
                                      },
                                      icon: Icon(
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                  edit: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                        Icons.edit,
                                        color: Appcolors.buttoncolor,
                                      ))),
                            ),
                          );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: BlocProvider.of<showemployeescuibt>(context)
                              .loading ==
                          true
                      ? BlocProvider.of<showemployeescuibt>(context)
                              .employeesdata
                              .length +
                          1
                      : BlocProvider.of<showemployeescuibt>(context)
                          .employeesdata
                          .length),
            );
          }))
        ]));
  }
}
