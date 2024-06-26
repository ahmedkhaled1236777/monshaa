import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/clients/data/model/clientmodelrequest.dart';
import 'package:aplication/features/clients/presentation/view/clients.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:aplication/features/contracts/presentation/views/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/clientmodel/datum.dart';

class editclientdialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController clientname;
  final TextEditingController clientphone;
  final TextEditingController code;
  final TextEditingController notes;

  editclientdialog({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.clientname,
    required this.clientphone,
    required this.code,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<clientsCubit, clientsState>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(children: [
                const SizedBox(
                  height: Appsizes.size20,
                ),
                Image.asset(
                  'images/appartments.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل العملاء',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Column(
                  children: [
                    custommytextform(
                        controller: clientname, hintText: "اسم العميل"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                        controller: clientphone, hintText: "رقم هاتف العميل"),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(controller: code, hintText: "الكود"),
                    const SizedBox(
                      height: 10,
                    ),
                    dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<clientsCubit>(context)
                              .changestatus(val);
                        },
                        items: [
                          "انتظار",
                          "معاينه",
                          "معاينه مقبوله",
                          "معاينه مرفوضه",
                        ],
                        name: BlocProvider.of<clientsCubit>(context).status,
                        hint: "الحاله"),
                    const SizedBox(
                      height: 10,
                    ),
                    dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<clientsCubit>(context)
                              .changedepartement(val);
                        },
                        items: [
                          "عقار بيع",
                          "عقار ايجار",
                          "ارض بيع",
                        ],
                        name:
                            BlocProvider.of<clientsCubit>(context).departement,
                        hint: "القسم"),
                    const SizedBox(
                      height: Appsizes.size10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).date5,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changedate5(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      maxlines: 3,
                      controller: notes,
                      hintText: "ملاحظات",
                    ),
                  ],
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<clientsCubit, clientsState>(
                  listener: (context, state) {
                    if (state is editclientsfailure) {
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editclientssuccess) {
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      BlocProvider.of<clientsCubit>(context).departement = null;
                      BlocProvider.of<clientsCubit>(context).status = null;
                      navigateandfinish(
                          navigationscreen: clients(), context: context);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editclientsloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<clientsCubit>(context).updateclients(
                              token: generaltoken,
                              id: data.id!.toInt(),
                              clientsmodel: clientmodelrequest(
                                  name: clientname.text,
                                  phone: clientphone.text,
                                  code: code.text.isEmpty ? "0" : code.text,
                                  departement: clientsdepartementrequest[
                                      BlocProvider.of<clientsCubit>(context)
                                          .departement],
                                  status: clientstatussrequest[
                                      BlocProvider.of<clientsCubit>(context)
                                          .status],
                                  inspectiondate:
                                      BlocProvider.of<DateCubit>(context)
                                                  .date5 ==
                                              "تاريخ المعاينه"
                                          ? ""
                                          : BlocProvider.of<DateCubit>(context)
                                              .date5,
                                  notes: notes.text));
                        },
                        button_name: "تعديل الايراد",
                        buttonicon: Icons.edit);
                  },
                ),
                SizedBox(
                  height: 40,
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
