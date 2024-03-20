import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/showdialogerror.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/dropdown.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/revenus/data/model/revenumodelrequest.dart';
import 'package:aplication/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:aplication/features/revenus/presentation/viewmodel/revenuecuibt/revenue_state.dart';
import 'package:aplication/features/revenus/presentation/views/choosedates.dart';
import 'package:aplication/features/revenus/presentation/views/revenues.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addrevenue extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addrevenue({super.key, required this.formkey, required this.width});

  @override
  State<addrevenue> createState() => _addrevenueState();
}

class _addrevenueState extends State<addrevenue> {
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        width: widget.width,
        color: Colors.white,
        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
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
                const Text('تسجيل الايرادات',
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff2ba4c8),
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: 15,
                ),
                custommytextform(
                  controller: amount,
                  hintText: "المبلغ",
                  val: "برجاء ادخال المبلغ",
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<revenueCubit, revenueState>(
                  builder: (context, state) {
                    return dropdownbutton(
                        onchanged: (val) {
                          BlocProvider.of<revenueCubit>(context)
                              .changedesctype(val);
                        },
                        items: ["عقد ايجار", "عقد بيع", "سند صرف"],
                        name: BlocProvider.of<revenueCubit>(context).desctype,
                        hint: "الوصف");
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                choosedate(),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocConsumer<revenueCubit, revenueState>(
                  listener: (context, state) {
                    if (state is Addrevenuefailure)
                      showsnack(comment: state.error_message, context: context);
                    if (state is Addrevenuesuccess) {
                      amount.clear();
                      BlocProvider.of<revenueCubit>(context).cleardesctype();
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      navigateandfinish(
                          navigationscreen: revenues(), context: context);
                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is Addrevenueloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (widget.formkey.currentState!.validate()) {
                            if (BlocProvider.of<DateCubit>(context).date1 ==
                                "التاريخ") {
                              showdialogerror(
                                  error: "برجاء اختيار التاريخ",
                                  context: context);
                            } else {
                              await BlocProvider.of<revenueCubit>(context)
                                  .addrevenue(
                                      token: generaltoken,
                                      revenue: revenuesmodelrequest(
                                          type: "revenue",
                                          amount: amount.text,
                                          description:
                                              BlocProvider.of<revenueCubit>(
                                                      context)
                                                  .desctype!,
                                          date: BlocProvider.of<DateCubit>(
                                                  context)
                                              .date1));
                            }
                          }
                        },
                        button_name: "تسجيل البيانات",
                        buttonicon: Icons.save);
                  },
                )
              ],
            ))));
  }
}
