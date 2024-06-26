import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/showdialogerror.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/addaqarcuibt/addaqarstate.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:aplication/features/expenses.dart/presentation/views/expenses.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addexpense extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addexpense({super.key, required this.formkey, required this.width});

  @override
  State<addexpense> createState() => _addexpenseState();
}

class _addexpenseState extends State<addexpense> {
  TextEditingController amount = TextEditingController();

  TextEditingController descreption = TextEditingController();

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
                Image.asset(
                  'images/give.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('تسجيل المصروفات',
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
                custommytextform(
                  maxlines: 3,
                  controller: descreption,
                  hintText: "الوصف مثل..فاتوره..مرتب",
                  val: "برجاء ادخال الوصف مثل..فاتوره..مرتب",
                ),
                const SizedBox(
                  height: 10,
                ),
                choosedate(),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) {
                    if (state is Addexpensefailure)
                      showsnack(comment: state.error_message, context: context);
                    if (state is Addexpensesuccess) {
                      amount.clear();
                      descreption.clear();
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      navigateandfinish(
                          navigationscreen: expenses(), context: context);
                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is Addexpenseloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          if (widget.formkey.currentState!.validate()) {
                            if (BlocProvider.of<DateCubit>(context).date1 ==
                                "التاريخ") {
                              showdialogerror(
                                  error: "برجاء اختيار التاريخ",
                                  context: context);
                            } else {
                              await BlocProvider.of<expenseCubit>(context)
                                  .addexpense(
                                      token: generaltoken,
                                      expense: expensesmodelrequest(
                                          type: "expense",
                                          amount: amount.text,
                                          description: descreption.text,
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

  @override
  void dispose() {
    amount.dispose();

    descreption.dispose();
    super.dispose();
  }
}
