import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reports/presentation/view/aqaratreports.dart/presentation/view/customtableaqaratreportitem.dart';
import 'package:aplication/features/reports/presentation/view/aqaratreports.dart/presentation/view/search.dart';
import 'package:aplication/features/reports/presentation/view/aqaratreports.dart/presentation/viewmodel/aqaratreports/aqaratreports_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobileaqaratreportss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobileaqaratreportss> createState() =>
      _customtableallmobileaqaratreportssState();
}

class _customtableallmobileaqaratreportssState
    extends State<customtableallmobileaqaratreportss> {
  initscroll() async {
    await BlocProvider.of<AqaratreportsCubit>(context)
        .getallaqarat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<AqaratreportsCubit>(context)
            .getamorellaqarat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<AqaratreportsCubit>(context);
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
              actions: [
                IconButton(
                    onPressed: () async {
                      BlocProvider.of<AqaratreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<AqaratreportsCubit>(context)
                          .getallaqarat(token: generaltoken, page: 1);
                    },
                    icon: const Icon(Icons.blur_circular_rounded,
                        color: Appcolors.whitecolor)),
                aqaratsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'العقارات',
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
                            children:
                                BlocProvider.of<AqaratreportsCubit>(context)
                                    .mobileheadertabeleallaqaratreportss
                                    .map((e) => customheadertable(
                                          title: e,
                                          flex: 3,
                                          textStyle:
                                              Appstyles.getheadertextstyle(
                                                  context: context),
                                        ))
                                    .toList()),
                      ),
                      Expanded(
                        child: BlocConsumer<AqaratreportsCubit,
                            AqaratreportsState>(
                          listener: (context, state) {
                            if (state is Aqaratreportsfailure)
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is Aqaratreportsloading) return loading();
                            if (state is Aqaratreportsfailure)
                              return SizedBox();
                            return SingleChildScrollView(
                                controller: widget.scrollController,
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return index >=
                                              BlocProvider.of<
                                                          AqaratreportsCubit>(
                                                      context)
                                                  .data
                                                  .length
                                          ? loading()
                                          : customtableaqaratreportsitem(
                                              departement: show[
                                                  prov.data[index].department!],
                                              textStyle:
                                                  Appstyles.gettabletextstyle(
                                                      context: context),
                                              emoloyeename:
                                                  prov.data[index].user!.name!,
                                              date: prov.data[index].createdAt!,
                                              adress: prov.data[index]
                                                  .realStateAddress!,
                                              type: show[prov
                                                  .data[index].realStateType!],
                                            );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: BlocProvider.of<
                                                    AqaratreportsCubit>(context)
                                                .loading ==
                                            true
                                        ? BlocProvider.of<AqaratreportsCubit>(
                                                    context)
                                                .data
                                                .length +
                                            1
                                        : BlocProvider.of<AqaratreportsCubit>(
                                                context)
                                            .data
                                            .length));
                          },
                        ),
                      )
                    ]))));
  }
}
