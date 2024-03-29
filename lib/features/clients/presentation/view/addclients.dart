import 'package:aplication/core/commn/constants.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/clients/data/model/clientmodelrequest.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_cubit.dart';
import 'package:aplication/features/clients/presentation/viewmodel/clients/clients_state.dart';
import 'package:aplication/features/contracts/presentation/views/customshoosedate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addclients extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addclients({super.key, required this.formkey, required this.width});

  @override
  State<addclients> createState() => _addclientsState();
}

class _addclientsState extends State<addclients> {
  TextEditingController clientname = TextEditingController();
  TextEditingController clientphone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<clientsCubit, clientsState>(
      builder: (context, state) {
        return Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            width: widget.width,
            color: Colors.white,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
            child: Form(
                key: widget.formkey,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Image.asset(
                      'images/people.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('تسجيل العملاء',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff2ba4c8),
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.right),
                    const SizedBox(
                      height: 15,
                    ),
                    custommytextform(
                      controller: clientname,
                      hintText: "اسم العميل",
                      val: "برجاء ادخال اسم العميل",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: clientphone,
                      hintText: "رقم هاتف العميل",
                      val: "برجاء ادخال رقم هاتف العميل",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: code,
                      hintText: "الكود",
                    ),
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
                    const SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<clientsCubit, clientsState>(
                      listener: (context, state) {
                        if (state is Addclientsfailure)
                          showsnack(
                              comment: state.error_message, context: context);
                        if (state is Addclientssuccess) {
                          notes.clear();
                          clientname.clear();
                          clientphone.clear();
                          code.clear();
                          BlocProvider.of<DateCubit>(context).cleardates();
                          BlocProvider.of<clientsCubit>(context).cleardata();

                          showsnack(
                              comment: state.success_message, context: context);
                        }
                      },
                      builder: (context, state) {
                        if (state is Addclientsloading) return loading();
                        return custommaterialbutton(
                            onPressed: () async {
                              await BlocProvider.of<clientsCubit>(context).addclients(
                                  token: generaltoken,
                                  clients: clientmodelrequest(
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
                                              : BlocProvider.of<DateCubit>(
                                                      context)
                                                  .date5,
                                      notes: notes.text));
                            },
                            button_name: "تسجيل البيانات",
                            buttonicon: Icons.save);
                      },
                    )
                  ],
                ))));
      },
    );
  }
}
