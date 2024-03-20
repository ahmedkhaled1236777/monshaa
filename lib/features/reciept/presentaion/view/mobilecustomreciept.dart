import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reciept/presentaion/view/customtableallrecieptsitem.dart';
import 'package:aplication/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:aplication/features/reciept/presentaion/viewmodel/recieptcuibt/recieptstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilereciepts extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobilereciepts> createState() =>
      _customtableallmobilerecieptsState();
}

class _customtableallmobilerecieptsState
    extends State<customtableallmobilereciepts> {
  initscroll() async {
    await BlocProvider.of<recieptCubit>(context)
        .getallreciepts(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<recieptCubit>(context)
            .getallmorereciepts(token: generaltoken);
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
            'سند صرف',
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
                    children: BlocProvider.of<recieptCubit>(context)
                        .mobileheadertabeleallreciepts
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
                  child: BlocConsumer<recieptCubit, recieptState>(
                      listener: (context, state) {
                if (state is showrecieptfailure) {
                  showsnack(comment: state.errorr_message, context: context);
                }
              }, builder: (context, state) {
                if (state is showrecieptloadin) return loading();
                if (state is showrecieptfailure) return SizedBox();
                return SingleChildScrollView(
                    controller: widget.scrollController,
                    child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return index >=
                                  BlocProvider.of<recieptCubit>(context)
                                      .myreciepts
                                      .length
                              ? loading()
                              : customtablerecieptsitem(
                                  textStyle: Appstyles.gettabletextstyle(
                                      context: context),
                                  cashnumber: (index + 1).toString(),
                                  date: BlocProvider.of<recieptCubit>(context)
                                      .myreciepts[index]
                                      .transactionDate!,
                                  ownername:
                                      BlocProvider.of<recieptCubit>(context)
                                          .myreciepts[index]
                                          .ownerName!,
                                  amountofmoney:
                                      BlocProvider.of<recieptCubit>(context)
                                          .myreciepts[index]
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
                                        BlocProvider.of<recieptCubit>(context)
                                            .deletereciept(
                                                token: generaltoken,
                                                recieptid: BlocProvider.of<
                                                        recieptCubit>(context)
                                                    .myreciepts[index]
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
                        itemCount: BlocProvider.of<recieptCubit>(context)
                                    .loading ==
                                true
                            ? BlocProvider.of<recieptCubit>(context)
                                    .myreciepts
                                    .length +
                                1
                            : BlocProvider.of<recieptCubit>(context)
                                .myreciepts
                                .length));
              }))
            ])),
      ),
    );
  }
}
