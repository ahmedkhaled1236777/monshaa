import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/financial/presentation/view/customtablefinancialsitem.dart';
import 'package:aplication/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:aplication/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilefinancials extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobilefinancials> createState() =>
      _customtableallmobilefinancialsState();
}

class _customtableallmobilefinancialsState
    extends State<customtableallmobilefinancials> {
  initscroll() async {
    await BlocProvider.of<financialCubit>(context)
        .getallfinancials(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<financialCubit>(context)
            .getallmorefinancials(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: widget.scafoldstate,
        backgroundColor: Appcolors.maincolor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              widget.scafoldstate.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: Text(
            'سند قبض',
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.sizeOf(context).width > 600 ? 6.sp : 9.sp),
          ),
          centerTitle: true,
          backgroundColor: Appcolors.maincolor,
          actions: [
            Row(
              children: [
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
        body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 50,
                color: Appcolors.buttoncolor,
                child: Row(
                    children: BlocProvider.of<financialCubit>(context)
                        .mobileheadertabeleallfinancials
                        .map((e) => customheadertable(
                              title: e,
                              flex:
                                  e == "طباعه" || e == "حذف" || e == "رقم القسط"
                                      ? 2
                                      : 3,
                              textStyle: Appstyles.getheadertextstyle(
                                  context: context),
                            ))
                        .toList()),
              ),
              Expanded(
                  child: BlocConsumer<financialCubit, financialState>(
                      listener: (context, state) {
                if (state is showfinancialfailure) {
                  showsnack(comment: state.errorr_message, context: context);
                }
              }, builder: (context, state) {
                if (state is showfinancialloadin) return loading();
                if (state is showfinancialfailure) return SizedBox();
                return SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<financialCubit>(context)
                                      .myfinancials
                                      .length
                              ? loading()
                              : customtablefinancialsitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  cashnumber: (index + 1).toString(),
                                  date: BlocProvider.of<financialCubit>(context)
                                      .myfinancials[index]
                                      .transactionDate!,
                                  tenantname:
                                      BlocProvider.of<financialCubit>(context)
                                          .myfinancials[index]
                                          .tenantName!,
                                  amountofmoney:
                                      BlocProvider.of<financialCubit>(context)
                                          .myfinancials[index]
                                          .totalAmount
                                          .toString(),
                                  print: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.print,
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                      )),
                                  delete: IconButton(
                                      onPressed: () {
                                        BlocProvider.of<financialCubit>(context)
                                            .deletefinancial(
                                                token: generaltoken,
                                                financialid: BlocProvider.of<
                                                        financialCubit>(context)
                                                    .myfinancials[index]
                                                    .id!
                                                    .toInt());
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size:
                                            MediaQuery.of(context).size.width <
                                                    600
                                                ? 20.sp
                                                : 22,
                                      )));
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount:
                            BlocProvider.of<financialCubit>(context).loading ==
                                    true
                                ? BlocProvider.of<financialCubit>(context)
                                        .myfinancials
                                        .length +
                                    1
                                : BlocProvider.of<financialCubit>(context)
                                    .myfinancials
                                    .length));
              }))
            ])),
      ),
    );
  }
}
