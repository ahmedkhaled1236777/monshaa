import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/data/models/showstate/showstate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarcuibt.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/edit/edit_cubit.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/showaqarat/showaqarat_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customheadertable.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customtableitem.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/editdialog.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/showestate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customtableaqar extends StatefulWidget {
  ScrollController scrollController = ScrollController();
  final double width;
  customtableaqar(this.width);

  @override
  State<customtableaqar> createState() => _customtableaqarState();
}

class _customtableaqarState extends State<customtableaqar> {
  initscroll() {
    BlocProvider.of<ShowaqaratCubit>(context).data.clear();
    BlocProvider.of<ShowaqaratCubit>(context)
        .getallaqarat(token: cashhelper.getdata(key: "token"), page: 1);
    widget.scrollController.addListener(() async {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        await BlocProvider.of<ShowaqaratCubit>(context)
            .getamorellaqarat(token: cashhelper.getdata(key: "token"));
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
                children: BlocProvider.of<addaqarcuibt>(context)
                    .headertable
                    .map((e) => customheadertable(
                          title: e,
                          flex: e == "تعديل" || e == "حذف" ? 2 : 3,
                          textStyle:
                              Appstyles.getheadertextstyle(context: context),
                        ))
                    .toList()),
          ),
          Expanded(
              child: BlocConsumer<ShowaqaratCubit, ShowaqaratState>(
                  listener: (context, state) {
            if (state is Showaqaratfailure)
              showsnack(comment: state.error_message, context: context);
          }, builder: (context, state) {
            if (state is Showaqaratloading) {
              return loading();
              // ignore: curly_braces_in_flow_control_structures
            } else if (state is Showaqaratfailure) return const SizedBox();
            return SingleChildScrollView(
              controller: widget.scrollController,
              child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return index >=
                            BlocProvider.of<ShowaqaratCubit>(context)
                                .data
                                .length
                        ? loading()
                        : InkWell(
                            onTap: (() {
                              navigateto(
                                  navigationscreen: mShowEstate(
                                    data: BlocProvider.of<ShowaqaratCubit>(
                                            context)
                                        .data[index],
                                  ),
                                  context: context);
                            }),
                            child: customtableitem(
                                textStyle: Appstyles.gettabletextstyle(
                                    context: context),
                                iconsize:
                                    MediaQuery.of(context).size.width < 600
                                        ? 20.sp
                                        : 22,
                                adress:
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .data[index]
                                        .realStateAddress!,
                                section: show[
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .data[index]
                                        .department!],
                                price: BlocProvider.of<ShowaqaratCubit>(context)
                                    .data[index]
                                    .realStatePrice
                                    .toString(),
                                type: show[
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .data[index]
                                        .realStateType!],
                                advertise_type: show[
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .data[index]
                                        .advertiserType!],
                                edit: IconButton(
                                  icon: Icon(
                                    Icons.edit,
                                    size:
                                        MediaQuery.of(context).size.width < 600
                                            ? 20.sp
                                            : 22,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<addaqarcuibt>(context)
                                        .images = [];
                                    BlocProvider.of<addaqarcuibt>(context)
                                        .imageFile = [];
                                    BlocProvider.of<DateCubit>(context).date1 =
                                        BlocProvider.of<ShowaqaratCubit>(
                                                context)
                                            .data[index]
                                            .createdAt!;
                                    BlocProvider.of<EditCubit>(context)
                                        .advistor_type = null;
                                    BlocProvider.of<EditCubit>(context)
                                        .aqartype = null;
                                    BlocProvider.of<EditCubit>(context)
                                        .departement = null;
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            scrollable: true,
                                            content:
                                              editdialog(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.5,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.85,
                                                advertiser_name:
                                                    TextEditingController(
                                                        text: BlocProvider.of<
                                                                    ShowaqaratCubit>(
                                                                context)
                                                            .data[index]
                                                            .advertiser_name),
                                                aqarnumber: TextEditingController(
                                                    text: BlocProvider.of<
                                                                ShowaqaratCubit>(
                                                            context)
                                                        .data[index]
                                                        .apartmentNumber),
                                                data: BlocProvider.of<
                                                            ShowaqaratCubit>(
                                                        context)
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
                                            
                                          );
                                        });
                                  },
                                ),
                                delet: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size:
                                        MediaQuery.of(context).size.width < 600
                                            ? 20.sp
                                            : 22,
                                  ),
                                  onPressed: () {
                                    BlocProvider.of<ShowaqaratCubit>(context)
                                        .deleteaqar(
                                            token: generaltoken,
                                            aqarnumber: BlocProvider.of<
                                                    ShowaqaratCubit>(context)
                                                .data[index]
                                                .id!
                                                .toInt());
                                  },
                                )));
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount:
                      BlocProvider.of<ShowaqaratCubit>(context).loading == true
                          ? BlocProvider.of<ShowaqaratCubit>(context)
                                  .data
                                  .length +
                              1
                          : BlocProvider.of<ShowaqaratCubit>(context)
                              .data
                              .length),
            );
          }))
        ]));
  }
}
