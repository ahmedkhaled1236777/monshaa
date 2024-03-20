import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_cubit.dart';
import 'package:aplication/features/contracts/presentation/viewmodel/contract/contract_state.dart';
import 'package:aplication/features/reciept/presentaion/view/addrecieptwithscafold.dart';
import 'package:aplication/features/reciept/presentaion/view/cuatomtableallreciepts.dart';
import 'package:aplication/features/reciept/presentaion/view/customtablerecieptitem.dart';
import 'package:aplication/features/reciept/presentaion/view/mobilecustomreciept.dart';
import 'package:aplication/features/reciept/presentaion/view/reciept.dart';
import 'package:aplication/features/reciept/presentaion/viewmodel/recieptcuibt/recieptcuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/commn/navigation.dart';
import 'allreciepts.dart';

class customtablereciepts extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtablereciepts(this.width);

  @override
  State<customtablereciepts> createState() => _customtablerecieptsState();
}

class _customtablerecieptsState extends State<customtablereciepts> {
  initscroll() async {
    BlocProvider.of<contractCubit>(context).queryParameters = null;
    if (BlocProvider.of<contractCubit>(context).contractdata.isEmpty)
      await BlocProvider.of<contractCubit>(context)
          .getallcontracts(token: generaltoken, page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<contractCubit>(context)
            .getallmorecontracts(token: generaltoken);
      }
    });
  }

  @override
  void initState() {
    initscroll();
  }

  @override
  Widget build(BuildContext context) {
    var contract = BlocProvider.of<contractCubit>(context).contractdata;
    return Container(
        color: Colors.white,
        width: widget.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 50,
            color: Appcolors.buttoncolor,
            child: Row(
                children: BlocProvider.of<recieptCubit>(context)
                    .headertabel
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "صرف" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<contractCubit, contractState>(
                  listener: (context, state) {
            if (state is showcontractfailure) {
              showsnack(comment: state.errorr_message, context: context);
            }
          }, builder: (context, state) {
            if (state is showcontractloadin) return loading();
            if (state is showcontractfailure) return SizedBox();
            return SingleChildScrollView(
                controller: widget.scrollController,
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return index >=
                              BlocProvider.of<contractCubit>(context)
                                  .contractdata
                                  .length
                          ? loading()
                          : GestureDetector(
                              onTap: () {
                                BlocProvider.of<recieptCubit>(context)
                                    .queryParameters = {
                                  "owner_phone":
                                      BlocProvider.of<contractCubit>(context)
                                          .contractdata[index]
                                          .ownerPhone!
                                };
                                navigateto(
                                    navigationscreen: allreciepts(),
                                    context: context);
                              },
                              child: customtablerecieptitem(
                                textStyle: Appstyles.gettabletextstyle(
                                    context: context),
                                tenantname:
                                    BlocProvider.of<contractCubit>(context)
                                        .contractdata[index]
                                        .tenant!
                                        .name!
                                        .toString()!,
                                ownername:
                                    BlocProvider.of<contractCubit>(context)
                                        .contractdata[index]
                                        .ownerName!,
                                aqaradress:
                                    BlocProvider.of<contractCubit>(context)
                                        .contractdata[index]
                                        .realStateAddress!,
                                amountofmoney:
                                    BlocProvider.of<contractCubit>(context)
                                        .contractdata[index]
                                        .contractTotal
                                        .toString(),
                                addreciept: IconButton(
                                    onPressed: () {
                                      BlocProvider.of<recieptCubit>(context)
                                          .id = BlocProvider.of<contractCubit>(
                                              context)
                                          .contractdata[index]
                                          .id!
                                          .toInt();
                                      if (MediaQuery.sizeOf(context).width <=
                                          950) {
                                        BlocProvider.of<recieptCubit>(context)
                                            .giverecieptdata(
                                                BlocProvider.of<contractCubit>(
                                                        context)
                                                    .contractdata[index]);
                                        navigateandfinish(
                                            context: context,
                                            navigationscreen:
                                                addrecieptwithscafold());
                                      } else {
                                        BlocProvider.of<recieptCubit>(context)
                                            .giverecieptdata(
                                                BlocProvider.of<contractCubit>(
                                                        context)
                                                    .contractdata[index]);
                                      }
                                    },
                                    icon: Icon(
                                      Icons.add_alert_outlined,
                                      size: MediaQuery.of(context).size.width <
                                              600
                                          ? 20.sp
                                          : 22,
                                    )),
                              ),
                            );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount:
                        BlocProvider.of<contractCubit>(context).loading == true
                            ? BlocProvider.of<contractCubit>(context)
                                    .contractdata
                                    .length +
                                1
                            : BlocProvider.of<contractCubit>(context)
                                .contractdata
                                .length));
          }))
        ]));
  }
}
