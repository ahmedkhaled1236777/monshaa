import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/showdialogerror.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/contracts/presentation/views/customshoosedate.dart';
import 'package:aplication/features/financial/data/model/financialmodelrequest.dart';
import 'package:aplication/features/financial/presentation/viewmodel/financial/financial_cubit.dart';
import 'package:aplication/features/financial/presentation/viewmodel/financial/financial_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addfinancial extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  const addfinancial({super.key, required this.formkey, required this.width});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<financialCubit, financialState>(
      builder: (context, state) {
        return Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            width: width,
            color: Colors.white,
            margin:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
            child: Form(
                key: formkey,
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Image.asset(
                      'images/people.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('سند قبض',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff2ba4c8),
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.right),
                    const SizedBox(
                      height: 15,
                    ),
                    custommytextform(
                      readonly: true,
                      controller:
                          BlocProvider.of<financialCubit>(context).tenantname,
                      hintText: "اسم المستأجر",
                      val: "برجاء ادخال اسم المستأجر",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      readonly: true,
                      controller:
                          BlocProvider.of<financialCubit>(context).ownername,
                      hintText: "اسم المالك",
                      val: "برجاء ادخال اسم المالك",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).date1,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changedate(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: Appsizes.size10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      readonly: true,
                      controller: BlocProvider.of<financialCubit>(context)
                          .amountofmoney,
                      hintText: "قيمة القسط",
                      val: "برجاء ادخال قيمة القسط ",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: BlocProvider.of<financialCubit>(context)
                          .installment_number,
                      hintText: "رقم القسط",
                      val: "برجاء ادخال رقم القسط ",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).date3,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changedate3(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<DateCubit, DateState>(
                      builder: (context, state) {
                        return choosedatecontract(
                          date: BlocProvider.of<DateCubit>(context).date4,
                          onPressed: () {
                            BlocProvider.of<DateCubit>(context)
                                .changedate4(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocConsumer<financialCubit, financialState>(
                      listener: (context, state) {
                        if (state is Addfinancialfailure)
                          showsnack(
                              comment: state.error_message, context: context);
                        if (state is Addfinancialsuccess) {
                          BlocProvider.of<financialCubit>(context).id = null;
                          BlocProvider.of<financialCubit>(context)
                              .clearcontrollers();

                          BlocProvider.of<DateCubit>(context).cleardates();

                          showsnack(
                              comment: state.success_message, context: context);
                        }
                      },
                      builder: (context, state) {
                        if (state is Addfinancialloading) return loading();
                        return custommaterialbutton(
                            onPressed: () async {
                              var player = new AudioPlayer();
                              const alarmAudioPath = "sound/click-124467.mp3";
                              player.play(UrlSource(alarmAudioPath));
                              if (formkey.currentState!.validate()) {
                                if (BlocProvider.of<DateCubit>(context).date1 ==
                                    "التاريخ") {
                                  showdialogerror(
                                      error: "برجاء اختيار التاريخ",
                                      context: context);
                                } else if (BlocProvider.of<DateCubit>(context)
                                        .date3 ==
                                    "الايجار من") {
                                  showdialogerror(
                                      error: "برجاء اختيار تاريخ الايجار من",
                                      context: context);
                                } else if (BlocProvider.of<DateCubit>(context)
                                        .date4 ==
                                    "الايجار الي") {
                                  showdialogerror(
                                      error: "برجاء اختيار تاريخ الايجار الي",
                                      context: context);
                                } else {
                                  await BlocProvider.of<financialCubit>(context).addfinancial(
                                      token: generaltoken,
                                      financial: financialmodelrequest(
                                          installment_number:
                                              BlocProvider.of<financialCubit>(context)
                                                  .installment_number
                                                  .text,
                                          date:
                                              BlocProvider.of<DateCubit>(context)
                                                  .date1,
                                          amountofmoney:
                                              BlocProvider.of<financialCubit>(
                                                      context)
                                                  .amountofmoney
                                                  .text,
                                          datefrom:
                                              BlocProvider.of<DateCubit>(context)
                                                  .date3,
                                          dateto:
                                              BlocProvider.of<DateCubit>(context)
                                                  .date4),
                                      id: BlocProvider.of<financialCubit>(context)
                                          .id!);
                                }
                              }
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
