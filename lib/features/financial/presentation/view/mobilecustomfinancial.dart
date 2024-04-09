import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/dialogerror.dart';
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

import '../../data/model/financialmodel/receipt.dart';

class customtableallmobilefinancials extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  customtableallmobilefinancials();

  @override
  State<customtableallmobilefinancials> createState() =>
      _customtableallmobilefinancialsState();
}

class _customtableallmobilefinancialsState
    extends State<customtableallmobilefinancials> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<financialCubit, financialState>(
      builder: (context, state) {
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
                    fontSize:
                        MediaQuery.sizeOf(context).width > 600 ? 6.sp : 9.sp),
              ),
              centerTitle: true,
              backgroundColor: Appcolors.maincolor,
            ),
            drawer: Dashboard(),
            body: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: Appcolors.buttoncolor,
                        child: Row(
                            children: BlocProvider.of<financialCubit>(context)
                                .mobileheadertabeleallfinancials
                                .map((e) => customheadertable(
                                      title: e,
                                      flex: e == "طباعه" ||
                                              e == "حذف" ||
                                              e == "رقم القسط"
                                          ? 2
                                          : 3,
                                      textStyle: Appstyles.getheadertextstyle(
                                          context: context),
                                    ))
                                .toList()),
                      ),
                      Expanded(
                          child: SingleChildScrollView(
                              controller: widget.scrollController,
                              child: ListView.separated(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return customtablefinancialsitem(
                                        textStyle: Appstyles.gettabletextstyle(
                                            context: context),
                                        cashnumber:
                                            (BlocProvider.of<financialCubit>(
                                                            context)
                                                        .myreciepts
                                                        .length -
                                                    index)
                                                .toString(),
                                        date: BlocProvider.of<financialCubit>(
                                                context)
                                            .myreciepts[index]
                                            .transactionDate!,
                                        tenantname:
                                            BlocProvider.of<financialCubit>(
                                                    context)
                                                .myreciepts[index]
                                                .tenantName!,
                                        amountofmoney:
                                            BlocProvider.of<financialCubit>(
                                                    context)
                                                .myreciepts[index]
                                                .totalAmount
                                                .toString(),
                                        print: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.print,
                                              size: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600
                                                  ? 20.sp
                                                  : 22,
                                            )),
                                        delete: IconButton(
                                            onPressed: () {
                                              awsomdialogerror(
                                                  context: context,
                                                  tittle:
                                                      "هل تريد حذف سند القبض ؟",
                                                  btnOkOnPress: () async {
                                                    await BlocProvider.of<
                                                                financialCubit>(
                                                            context)
                                                        .deletefinancial(
                                                            token: generaltoken,
                                                            financialid: BlocProvider
                                                                    .of<financialCubit>(
                                                                        context)
                                                                .myfinancials[
                                                                    index]
                                                                .id!
                                                                .toInt());
                                                    Navigator.pop(context);
                                                  });
                                            },
                                            icon: Icon(
                                              Icons.delete_outline_outlined,
                                              color: Colors.red,
                                              size: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      600
                                                  ? 20.sp
                                                  : 22,
                                            )));
                                  },
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                  itemCount:
                                      BlocProvider.of<financialCubit>(context)
                                          .myreciepts
                                          .length)))
                    ])),
          ),
        );
      },
    );
  }
}
