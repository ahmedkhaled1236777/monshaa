import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/dialogerror.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:aplication/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:aplication/features/revenus/presentation/views/customtablerevenuitem.dart';
import 'package:aplication/features/revenus/presentation/views/editrevenudialog.dart';
import 'package:aplication/features/revenus/presentation/views/showrevenuedialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtablerevenues extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablerevenues(this.width);

  @override
  State<customtablerevenues> createState() => _customtablerevenuesState();
}

class _customtablerevenuesState extends State<customtablerevenues> {
  initscroll() async {
    await BlocProvider.of<revenueCubit>(context)
        .getallrevenues(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<revenueCubit>(context)
            .getallmorerevenues(token: generaltoken);
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
                children: BlocProvider.of<revenueCubit>(context)
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
              child: BlocConsumer<revenueCubit, revenueState>(
                  listener: (context, state) {
            if (state is showrevenuefailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
            if (state is deleterevenuefailure)
              showsnack(comment: state.errormessage, context: context);
          }, builder: (context, state) {
            if (state is showrevenueloadin) return loading();
            if (state is showrevenuefailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<revenueCubit>(context)
                                  .revenuedata
                                  .length
                          ? loading()
                          : showrevenuedialog(
                              index: index,
                              child: customtablerevenueitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  amount: BlocProvider.of<revenueCubit>(context)
                                      .revenuedata[index]
                                      .totalMoney
                                      .toString()!,
                                  descrip:
                                      BlocProvider.of<revenueCubit>(context)
                                          .revenuedata[index]
                                          .description!,
                                  date: BlocProvider.of<revenueCubit>(context)
                                      .revenuedata[index]
                                      .transactionDate!,
                                  delet: IconButton(
                                      onPressed: () async {
                                        awsomdialogerror(
                                            context: context,
                                            tittle: "هل تريد حذف الايراد ؟",
                                            btnOkOnPress: () async {
                                              await BlocProvider.of<
                                                      revenueCubit>(context)
                                                  .deleterevenue(
                                                      token: generaltoken,
                                                      revenueid: BlocProvider
                                                              .of<revenueCubit>(
                                                                  context)
                                                          .revenuedata[index]
                                                          .id!
                                                          .toInt());
                                              Navigator.pop(context);
                                            });
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
                                      Icons.edit_note,
                                      size: MediaQuery.of(context).size.width <
                                              600
                                          ? 20.sp
                                          : 22,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<revenueCubit>(context)
                                              .desctype =
                                          BlocProvider.of<revenueCubit>(context)
                                              .revenuedata[index]
                                              .description!;
                                      BlocProvider.of<DateCubit>(context)
                                              .date1 =
                                          BlocProvider.of<revenueCubit>(context)
                                              .revenuedata[index]
                                              .transactionDate!;
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    icon: const Icon(
                                                        Icons.close)),
                                              ),
                                              surfaceTintColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0)),
                                              scrollable: true,
                                              content: editrevenuedialog(
                                                width: MediaQuery
                                                                .sizeOf(context)
                                                            .width >
                                                        950
                                                    ? MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25
                                                    : MediaQuery.sizeOf(context)
                                                            .width *
                                                        1,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.85,
                                                data: BlocProvider.of<
                                                        revenueCubit>(context)
                                                    .revenuedata[index],
                                                amount: TextEditingController(
                                                    text: BlocProvider.of<
                                                                revenueCubit>(
                                                            context)
                                                        .revenuedata[index]
                                                        .totalMoney!
                                                        .toString()),
                                                descreption:
                                                    TextEditingController(
                                                        text: BlocProvider.of<
                                                                    revenueCubit>(
                                                                context)
                                                            .revenuedata[index]
                                                            .description),
                                              ),
                                            );
                                          });
                                    },
                                  )),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<revenueCubit>(context).loading == true
                            ? BlocProvider.of<revenueCubit>(context)
                                    .revenuedata
                                    .length +
                                1
                            : BlocProvider.of<revenueCubit>(context)
                                .revenuedata
                                .length));
          }))
        ]));
  }
}
