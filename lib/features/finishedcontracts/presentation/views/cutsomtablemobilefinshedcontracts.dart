import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_cubit.dart';
import 'package:aplication/features/finishedcontracts/presentation/viewmodel/finishedcontracts/finishedcontracts_state.dart';
import 'package:aplication/features/finishedcontracts/presentation/views/customtablefinishedcontractitem.dart';
import 'package:aplication/features/home/presentation/views/widgets/dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableallmobilefinishedcontractss extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  GlobalKey<ScaffoldState> scafoldstate = GlobalKey<ScaffoldState>();

  @override
  State<customtableallmobilefinishedcontractss> createState() =>
      _customtableallmobilefinishedcontractssState();
}

class _customtableallmobilefinishedcontractssState
    extends State<customtableallmobilefinishedcontractss> {
  initscroll() async {
    await BlocProvider.of<finishedcontractsCubit>(context)
        .getallfinishedcontractss(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<finishedcontractsCubit>(context)
            .getallmorefinishedcontractss(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var prov = BlocProvider.of<finishedcontractsCubit>(context);
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
                'العقود المنتهيه',
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
                                BlocProvider.of<finishedcontractsCubit>(context)
                                    .mobileheadertabeleallfinishedcontractss
                                    .map((e) => customheadertable(
                                          title: e,
                                          flex: e == "طباعه" ||
                                                  e == "حذف" ||
                                                  e == "رقم القسط"
                                              ? 2
                                              : 3,
                                          textStyle:
                                              Appstyles.getheadertextstyle(
                                                  context: context),
                                        ))
                                    .toList()),
                      ),
                      Expanded(
                        child: BlocConsumer<finishedcontractsCubit,
                            finishedcontractsState>(
                          listener: (context, state) {
                            if (state is showfinishedcontractsfailure)
                              showsnack(
                                  comment: state.errorr_message,
                                  context: context);
                          },
                          builder: (context, state) {
                            if (state is showfinishedcontractsloadin)
                              return loading();
                            if (state is showfinishedcontractsfailure)
                              return SizedBox();
                            return SingleChildScrollView(
                                controller: widget.scrollController,
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return index >=
                                              BlocProvider.of<
                                                          finishedcontractsCubit>(
                                                      context)
                                                  .myfinishedcontractss
                                                  .length
                                          ? loading()
                                          : customtablefinishedcontractsitem(
                                              delet: IconButton(
                                                  onPressed: () async {
                                                    await BlocProvider.of<
                                                                finishedcontractsCubit>(
                                                            context)
                                                        .deletefinishedcontracts(
                                                            token: generaltoken,
                                                            finishedcontractsid:
                                                                BlocProvider.of<
                                                                            finishedcontractsCubit>(
                                                                        context)
                                                                    .myfinishedcontractss[
                                                                        index]
                                                                    .id!
                                                                    .toInt());
                                                  },
                                                  icon: Icon(
                                                    Icons.delete_outlined,
                                                    color: Colors.red,
                                                  )),
                                              tenentname: prov
                                                  .myfinishedcontractss[index]
                                                  .tenant!
                                                  .name!,
                                              textStyle:
                                                  Appstyles.gettabletextstyle(
                                                      context: context),
                                              ownername: prov
                                                  .myfinishedcontractss[index]
                                                  .ownerName!,
                                              ownerphone: prov
                                                  .myfinishedcontractss[index]
                                                  .ownerPhone!,
                                              adress: prov
                                                  .myfinishedcontractss[index]
                                                  .realStateAddress!,
                                              finisheddate: prov
                                                  .myfinishedcontractss[index]
                                                  .contractDateTo!,
                                            );
                                    },
                                    separatorBuilder: (context, index) =>
                                        const Divider(),
                                    itemCount: BlocProvider.of<
                                                        finishedcontractsCubit>(
                                                    context)
                                                .loading ==
                                            true
                                        ? BlocProvider.of<
                                                        finishedcontractsCubit>(
                                                    context)
                                                .myfinishedcontractss
                                                .length +
                                            1
                                        : BlocProvider.of<
                                                finishedcontractsCubit>(context)
                                            .myfinishedcontractss
                                            .length));
                          },
                        ),
                      )
                    ]))));
  }
}
