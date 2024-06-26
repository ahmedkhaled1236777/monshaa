import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/styles/style.dart';
import 'package:aplication/features/aqarat/presentation/viewmodel/date/date_cubit.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/expenses.dart/data/models/expensemodel/datum.dart';
import 'package:aplication/features/expenses.dart/data/models/expensemodelupdate.dart';
import 'package:aplication/features/expenses.dart/data/models/expensesmodelrequest.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_cubit.dart';
import 'package:aplication/features/expenses.dart/presentation/viewmodel/expense/expenses_state.dart';
import 'package:aplication/features/expenses.dart/presentation/views/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editexpensedialog extends StatelessWidget {
  final double width;
  final double height;
  final Datum data;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController amount;
  final TextEditingController descreption;

  editexpensedialog({
    super.key,
    required this.width,
    required this.height,
    required this.data,
    required this.amount,
    required this.descreption,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<expenseCubit, expenseState>(
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
                  'images/give.png',
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Text('تعديل المصروفات',
                    style: Appstyles.textStyle12
                        .copyWith(color: Appcolors.bluecolor),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      custommytextform(
                          val: "برجاء ادخال المبلغ",
                          controller: amount,
                          hintText: "المبلغ"),
                      const SizedBox(
                        height: 10,
                      ),
                      custommytextform(
                          maxlines: 5,
                          val: "برجاء ادخال الوصف",
                          controller: descreption,
                          hintText: "الوصف"),
                      const SizedBox(
                        height: 10,
                      ),
                      choosedate(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                BlocConsumer<expenseCubit, expenseState>(
                  listener: (context, state) {
                    if (state is editexpensefailure) {
                      showsnack(comment: state.error_message, context: context);
                    }
                    if (state is editexpensesuccess) {
                      BlocProvider.of<DateCubit>(context).date1 = "التاريخ";
                      navigateandfinish(
                          navigationscreen: expenses(), context: context);

                      showsnack(
                          comment: state.success_message, context: context);
                    }
                  },
                  builder: (context, state) {
                    if (state is editexpenseloading) return loading();
                    return custommaterialbutton(
                        onPressed: () async {
                          BlocProvider.of<expenseCubit>(context).updateexpense(
                              token: generaltoken,
                              id: data.id!.toInt(),
                              expensemodel: expensesmodelupdaterequest(
                                  amount: amount.text,
                                  description: descreption.text,
                                  date: BlocProvider.of<DateCubit>(context)
                                      .date1));
                        },
                        button_name: "تعديل الايراد",
                        buttonicon: Icons.edit);
                  },
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
