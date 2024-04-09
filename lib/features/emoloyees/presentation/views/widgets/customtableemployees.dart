import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/dialogerror.dart';
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
import 'package:aplication/features/emoloyees/presentation/views/widgets/editemployeedialog.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/showemployeedialog.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/show_employees.dart';
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
            if (state is deleteemployeefailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showemployeesloading) return loading();
            if (state is showemployeesfailure) return SizedBox();
            return SingleChildScrollView(
              controller: widget.scrollController,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        navigateto(
                            navigationscreen: ShowEmployees(),
                            context: context);
                      },
                      child: showtemployeedialog(
                        index: index,
                        child: customtableemployeeitem(
                            textStyle:
                                Appstyles.gettabletextstyle(context: context),
                            employeename:
                                BlocProvider.of<showemployeescuibt>(context)
                                    .employeesdata[index]
                                    .name!,
                            adress: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .address!,
                            phone: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .phone!,
                            job: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .jobTitle!,
                            delet: IconButton(
                                onPressed: () async {
                                  awsomdialogerror(
                                      context: context,
                                      tittle: "هل تريد حذف الموظف ؟",
                                      btnOkOnPress: () async {
                                        await await BlocProvider.of<
                                                showemployeescuibt>(context)
                                            .deleteemployee(
                                                token: generaltoken,
                                                employeenumber: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .id!
                                                    .toInt());
                                        Navigator.pop(context);
                                      });
                                },
                                icon: Icon(
                                  size: MediaQuery.of(context).size.width < 600
                                      ? 20.sp
                                      : 22,
                                  Icons.delete_outline_outlined,
                                  color: Colors.red,
                                )),
                            edit: IconButton(
                              icon: Icon(
                                Icons.edit_note,
                                size: MediaQuery.of(context).size.width < 600
                                    ? 20.sp
                                    : 22,
                              ),
                              onPressed: () {
                                BlocProvider.of<AddemployeeCubit>(context)
                                    .showselecteditems(
                                        BlocProvider.of<showemployeescuibt>(
                                                context)
                                            .employeesdata[index]
                                            .permissions!);
                                showDialog(
                                    barrierDismissible:
                                        false, // user must tap button!

                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                          title: Container(
                                            alignment: Alignment.topLeft,
                                            child: IconButton(
                                                onPressed: () {
                                                  BlocProvider.of<
                                                              AddemployeeCubit>(
                                                          context)
                                                      .resetdata();
                                                  Navigator.of(context).pop();
                                                },
                                                icon: const Icon(Icons.close)),
                                          ),
                                          surfaceTintColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0)),
                                          scrollable: true,
                                          content: editemployeedialog(
                                            index: index,
                                            width:
                                                MediaQuery.sizeOf(context)
                                                            .width >
                                                        950
                                                    ? MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25
                                                    : MediaQuery.sizeOf(context)
                                                            .width *
                                                        1,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.85,
                                            data: BlocProvider.of<
                                                    showemployeescuibt>(context)
                                                .employeesdata[index],
                                            employeename: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .name
                                                    .toString()),
                                            adress: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .address
                                                    .toString()),
                                            cardnumber: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .cardNumber
                                                    .toString()),
                                            phone: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .phone
                                                    .toString()),
                                            password: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .phone
                                                    .toString()),
                                            jobtittle: TextEditingController(
                                                text: BlocProvider.of<
                                                            showemployeescuibt>(
                                                        context)
                                                    .employeesdata[index]
                                                    .jobTitle
                                                    .toString()),
                                          ));
                                    });
                              },
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: BlocProvider.of<showemployeescuibt>(context)
                      .employeesdata
                      .length),
            );
          }))
        ]));
  }
}
