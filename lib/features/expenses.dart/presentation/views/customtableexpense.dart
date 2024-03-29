import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:aplication/features/expenses.dart/presentation/views/customtableexpenseitem.dart';
import 'package:aplication/features/expenses.dart/presentation/views/editexpenseialog.dart';
import 'package:aplication/features/expenses.dart/presentation/views/showexpensedialog.dart';
import 'package:aplication/features/lands/presentation/viewmodel/date/date_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableexpenses extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableexpenses(this.width);

  @override
  State<customtableexpenses> createState() => _customtableexpensesState();
}

class _customtableexpensesState extends State<customtableexpenses> {
  initscroll() async {
    await BlocProvider.of<expenseCubit>(context)
        .getallexpenses(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<expenseCubit>(context)
            .getallmoreexpenses(token: generaltoken);
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
                children: BlocProvider.of<expenseCubit>(context)
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
              child: BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) {
            if (state is showexpensefailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            if (state is showexpenseloadin) return loading();
            if (state is showexpensefailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<expenseCubit>(context)
                                  .expensedata
                                  .length
                          ? loading()
                          : showexpensedialog(
                              index: index,
                              child: customtableexpenseitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  amount: BlocProvider.of<expenseCubit>(context)
                                      .expensedata[index]
                                      .totalMoney
                                      .toString()!,
                                  descrip:
                                      BlocProvider.of<expenseCubit>(context)
                                          .expensedata[index]
                                          .description!,
                                  date: BlocProvider.of<expenseCubit>(context)
                                      .expensedata[index]
                                      .transactionDate!,
                                  delet: IconButton(
                                      onPressed: () async {
                                        await BlocProvider.of<expenseCubit>(
                                                context)
                                            .deleteexpense(
                                                token: generaltoken,
                                                expenseid: BlocProvider.of<
                                                        expenseCubit>(context)
                                                    .expensedata[index]
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
                                              .date1 =
                                          BlocProvider.of<expenseCubit>(context)
                                              .expensedata[index]
                                              .transactionDate!;
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
                                                content: editexpensedialog(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.5,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.85,
                                                  data: BlocProvider.of<
                                                          expenseCubit>(context)
                                                      .expensedata[index],
                                                  amount: TextEditingController(
                                                      text: BlocProvider.of<
                                                                  expenseCubit>(
                                                              context)
                                                          .expensedata[index]
                                                          .totalMoney!
                                                          .toString()),
                                                  descreption:
                                                      TextEditingController(
                                                          text: BlocProvider.of<
                                                                      expenseCubit>(
                                                                  context)
                                                              .expensedata[
                                                                  index]
                                                              .description),
                                                ));
                                          });
                                    },
                                  )),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<expenseCubit>(context).loading == true
                            ? BlocProvider.of<expenseCubit>(context)
                                    .expensedata
                                    .length +
                                1
                            : BlocProvider.of<expenseCubit>(context)
                                .expensedata
                                .length));
          }))
        ]));
  }
}
