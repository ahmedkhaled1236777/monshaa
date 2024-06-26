import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:aplication/features/reports/presentation/view/landsreports.dart/presentation/viewmodel/landsreports/landsreports_cubit.dart';
import 'package:aplication/features/reports/presentation/view/landsreports.dart/presentation/views/customtablelandsreports.dart';
import 'package:aplication/features/reports/presentation/view/landsreports.dart/presentation/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilelandatreportss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobilelandatreportss> createState() =>
      _customtableallmobilelandatreportssState();
}

class _customtableallmobilelandatreportssState
    extends State<customtableallmobilelandatreportss> {
  initscroll() async {
    await BlocProvider.of<landatreportsCubit>(context)
        .getalllandat(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<landatreportsCubit>(context)
            .getamorelllandat(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<landatreportsCubit>(context);
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
                      BlocProvider.of<landatreportsCubit>(context)
                          .queryParameters = null;
                      await BlocProvider.of<landatreportsCubit>(context)
                          .getalllandat(token: generaltoken, page: 1);
                    },
                    icon: const Icon(Icons.blur_circular_rounded,
                        color: Appcolors.whitecolor)),
                landatsearchreport(),
                SizedBox(
                  width: 5,
                )
              ],
              title: Text(
                'الاراضي',
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
                                BlocProvider.of<landatreportsCubit>(context)
                                    .mobileheadertabelealllandatreportss
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
                        child: BlocConsumer<landatreportsCubit,
                            landatreportsState>(
                          listener: (context, state) {
                            if (state is landatreportsfailure)
                              showsnack(
                                  comment: state.error_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is landatreportsloading) return loading();
                            if (state is landatreportsfailure)
                              return SizedBox();
                            return SingleChildScrollView(
                                controller: widget.scrollController,
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return index >=
                                              BlocProvider.of<
                                                          landatreportsCubit>(
                                                      context)
                                                  .data
                                                  .length
                                          ? loading()
                                          : customtablelandatreportsitem(
                                              priceofmeter: prov
                                                  .data[index].priceOfOneMeter
                                                  .toString()!,
                                              textStyle:
                                                  Appstyles.gettabletextstyle(
                                                      context: context),
                                              emoloyeename:
                                                  prov.data[index].user!.name!,
                                              date: prov.data[index].createdAt!,
                                              adress: prov.data[index].address!,
                                              area: prov
                                                  .data[index].sizeInMetres
                                                  .toString(),
                                            );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: BlocProvider.of<
                                                    landatreportsCubit>(context)
                                                .loading ==
                                            true
                                        ? BlocProvider.of<landatreportsCubit>(
                                                    context)
                                                .data
                                                .length +
                                            1
                                        : BlocProvider.of<landatreportsCubit>(
                                                context)
                                            .data
                                            .length));
                          },
                        ),
                      )
                    ]))));
  }
}
