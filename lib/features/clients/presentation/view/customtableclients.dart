import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/clients/presentation/view/customtableclientitem.dart';
import 'package:aplication/features/clients/presentation/view/editclientdialog.dart';
import 'package:aplication/features/clients/presentation/view/showclientdialog.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:aplication/features/expenses.dart/presentation/views/editexpenseialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableclientss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableclientss(this.width);

  @override
  State<customtableclientss> createState() => _customtableclientssState();
}

class _customtableclientssState extends State<customtableclientss> {
  initscroll() async {
    await BlocProvider.of<clientsCubit>(context)
        .getallclientss(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<clientsCubit>(context)
            .getallmoreclientss(token: generaltoken);
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
                children: BlocProvider.of<clientsCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<clientsCubit, clientsState>(
                  listener: (context, state) {
            if (state is showclientsfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            print("///////////////////////////////////////");
            print(state);
            print(BlocProvider.of<clientsCubit>(context).clientsdata.length);
            if (state is showclientsloadin) return loading();
            if (state is showclientsfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<clientsCubit>(context)
                                  .clientsdata
                                  .length
                          ? loading()
                          : showclientsdialog(
                              index: index,
                              child: customtableclientsitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  clientname:
                                      BlocProvider.of<clientsCubit>(context)
                                          .clientsdata[index]
                                          .name
                                          .toString()!,
                                  clientphone:
                                      BlocProvider.of<clientsCubit>(context)
                                          .clientsdata[index]
                                          .phone!,
                                  status: clientstatussresponse[
                                      BlocProvider.of<clientsCubit>(context)
                                          .clientsdata[index]
                                          .status!],
                                  delet: IconButton(
                                      onPressed: () async {
                                        await BlocProvider.of<clientsCubit>(
                                                context)
                                            .deleteclients(
                                                token: generaltoken,
                                                clientsid: BlocProvider.of<
                                                        clientsCubit>(context)
                                                    .clientsdata[index]
                                                    .id!
                                                    .toInt());
                                      },
                                      icon: Icon(
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                        Icons.delete_outline_outlined,
                                        color: Colors.red,
                                      )),
                                  edit: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      size: MediaQuery.of(context).size.width <
                                              600
                                          ? 20.sp
                                          : 22,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<DateCubit>(context)
                                              .date5 ??
                                          BlocProvider.of<clientsCubit>(context)
                                              .clientsdata[index]
                                              .inspectionDate;
                                      BlocProvider.of<clientsCubit>(context)
                                              .status =
                                          clientstatussresponse[
                                              BlocProvider.of<clientsCubit>(
                                                      context)
                                                  .clientsdata[index]
                                                  .status];
                                      BlocProvider.of<clientsCubit>(context)
                                              .departement =
                                          clientsdepartementresponse[
                                              "state_sale"];

                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                                title: Container(
                                                  alignment: Alignment.topLeft,
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                          Icons.close)),
                                                ),
                                                surfaceTintColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0)),
                                                scrollable: true,
                                                content: editclientdialog(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.5,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.85,
                                                  data: BlocProvider.of<
                                                          clientsCubit>(context)
                                                      .clientsdata[index],
                                                  clientname: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  clientsCubit>(
                                                              context)
                                                          .clientsdata[index]
                                                          .name
                                                          .toString()),
                                                  clientphone:
                                                      TextEditingController(
                                                          text: BlocProvider.of<
                                                                      clientsCubit>(
                                                                  context)
                                                              .clientsdata[
                                                                  index]
                                                              .phone),
                                                  code: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  clientsCubit>(
                                                              context)
                                                          .clientsdata[index]
                                                          .code),
                                                  notes: TextEditingController(
                                                      text: ""),
                                                ));
                                          });
                                    },
                                  )),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<clientsCubit>(context).loading == true
                            ? BlocProvider.of<clientsCubit>(context)
                                    .clientsdata
                                    .length +
                                1
                            : BlocProvider.of<clientsCubit>(context)
                                .clientsdata
                                .length));
          }))
        ]));
  }
}
