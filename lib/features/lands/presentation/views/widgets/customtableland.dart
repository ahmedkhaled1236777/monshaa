import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/data/models/showstate/showstate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableitem.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/editdialog.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/showestate.dart';
import 'package:aplication/features/lands/presentation/viewmodel/addaqarcuibt/addlandcuibt.dart';
import 'package:aplication/features/lands/presentation/viewmodel/showlands/showaqarat_cubit.dart';
import 'package:aplication/features/lands/presentation/views/widgets/customtablelanditem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableaqar extends StatefulWidget {
  final double width;
  customtableaqar(this.width);

  @override
  State<customtableaqar> createState() => _customtableaqarState();
}

class _customtableaqarState extends State<customtableaqar> {
  @override
  void initState() {
  
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
                children: BlocProvider.of<addlandcuibt>(context)
                    .headertable
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                          textStyle: MediaQuery.of(context).size.width > 950
                              ? Appstyles.textStyle13wd
                              : MediaQuery.of(context).size.width < 950 &&
                                      MediaQuery.of(context).size.width > 600
                                  ? Appstyles.textStyle13wd
                                      .copyWith(fontSize: 8.sp)
                                  : Appstyles.textStyle13wd
                                      .copyWith(fontSize: 12.sp),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<ShowlandsCubit, ShowlandsState>(
                  listener: (context, state) {
            if (state is Showlandsfailure)
              showsnack(comment: state.error_message, context: context);
          }, builder: (context, state) {
            if (state is Showlandsloading) {
              return loading();
              // ignore: curly_braces_in_flow_control_structures
            } else if (state is Showlandsfailure) return const SizedBox();
            return ListView.separated(
                controller:
                    BlocProvider.of<ShowlandsCubit>(context).scrollController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return index >=
                          BlocProvider.of<ShowlandsCubit>(context).data.length
                      ? loading()
                      : InkWell(
                          onTap: (() {
                            navigateto(
                                navigationscreen: mShowEstate(
                                  data:
                                      BlocProvider.of<ShowlandsCubit>(context)
                                          .data[index],
                                ),
                                context: context);
                          }),
                          child: customtablelanditem(
                            textStyle: MediaQuery.of(context).size.width < 600
                                ? Appstyles.textStyle12b
                                    .copyWith(fontSize: 12.sp)
                                : Appstyles.textStyle12b,
                            iconsize: MediaQuery.of(context).size.width < 600
                                ? 20.sp
                                : 22,
                            adress: BlocProvider.of<ShowlandsCubit>(context)
                                .data[index]
                                .realStateAddress!,
                            priceofmeter: show[
                                BlocProvider.of<ShowlandsCubit>(context)
                                    .data[index]
                                    .department!],
                            area: BlocProvider.of<ShowlandsCubit>(context)
                                .data[index]
                                .realStatePrice
                                .toString(),
                            totalcost: show[BlocProvider.of<ShowlandsCubit>(context)
                                .data[index]
                                .realStateType!],
                            advertise_type: show[
                                BlocProvider.of<ShowlandsCubit>(context)
                                    .data[index]
                                    .advertiserType!],
                            edit: IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: MediaQuery.of(context).size.width < 600
                                    ? 20.sp
                                    : 22,
                              ),
                              onPressed: () {
                                BlocProvider.of<addaqarcuibt>(context).images =
                                    [];
                                BlocProvider.of<addaqarcuibt>(context)
                                    .imageFile = [];
                                BlocProvider.of<DateCubit>(context).date1 =
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .data[index]
                                        .createdAt!;
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        scrollable: true,
                                        actions: [
                                          editdialog(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.5,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.85,
                                            aqarnumber: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .apartmentNumber),
                                            data: BlocProvider.of<
                                                    ShowaqaratCubit>(context)
                                                .data[index],
                                            adress: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .realStateAddress),
                                            toilletsnumber:
                                                TextEditingController(
                                                    text: BlocProvider.of<
                                                                ShowaqaratCubit>(
                                                            context)
                                                        .data[index]
                                                        .numberOfBathrooms
                                                        .toString()),
                                            housenumber: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .buildingNumber
                                                    .toString()),
                                            phone: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .advertisedPhoneNumber
                                                    .toString()),
                                            roomsnumber: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .numberOfRooms
                                                    .toString()),
                                            price: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .realStatePrice
                                                    .toString()),
                                            details: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .advertiseDetails
                                                    .toString()),
                                            adressdetails: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .realStateAddressDetails
                                                    .toString()),
                                            area: TextEditingController(
                                                text: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
                                                    .data[index]
                                                    .realStateSpace
                                                    .toString()),
                                          )
                                        ],
                                      );
                                    });
                              },
                            ),
                            delet:
                                BlocBuilder<ShowaqaratCubit, ShowaqaratState>(
                                    builder: (context, state) {
                              return IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: MediaQuery.of(context).size.width < 600
                                      ? 20.sp
                                      : 22,
                                ),
                                onPressed: () {
                                  BlocProvider.of<ShowaqaratCubit>(context)
                                      .deleteaqar(
                                          token: generaltoken,
                                          aqarnumber:
                                              BlocProvider.of<ShowaqaratCubit>(
                                                      context)
                                                  .data[index]
                                                  .id!
                                                  .toInt());
                                },
                              );
                            }),
                          ),
                        );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: BlocProvider.of<ShowlandsCubit>(context).loading ==
                        true
                    ? BlocProvider.of<ShowlandsCubit>(context).data.length + 1
                    : BlocProvider.of<ShowlandsCubit>(context).data.length);
          }))
        ]));
  }
}
