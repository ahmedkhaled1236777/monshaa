import 'package:aplication/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:aplication/features/revenus/presentation/viewmodel/revenuecuibt/revenue_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showrevenuedialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showrevenuedialog(
      {super.key, required this.index, required this.child});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  width: 400,
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/people.png',
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('بيانات المصروف',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff2ba4c8),
                                fontWeight: FontWeight.w100),
                            textAlign: TextAlign.right),
                        const SizedBox(
                          height: 100,
                        ),
                        customdescription(
                            description: "اسم القائم بالعمليه",
                            value: BlocProvider.of<revenueCubit>(context)
                                .revenuedata[index]
                                .user!
                                .name!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "رقم الهاتف",
                            value: BlocProvider.of<revenueCubit>(context)
                                .revenuedata[index]
                                .user!
                                .phone!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "المبلغ",
                            value: BlocProvider.of<revenueCubit>(context)
                                .revenuedata[index]
                                .totalMoney!
                                .toString()),
                        const SizedBox(
                          height: 15,
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: customdescription(
                              firstfshape: false,
                              height: MediaQuery.sizeOf(context).height * 0.05,
                              description: "الوصف",
                              value: BlocProvider.of<revenueCubit>(context)
                                  .revenuedata[index]
                                  .description!),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
