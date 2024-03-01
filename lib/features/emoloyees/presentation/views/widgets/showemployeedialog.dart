import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/widgets/cashedimage.dart';
import 'package:aplication/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/showemployeecuibt/employeecuibt.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class showtemployeedialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showtemployeedialog(
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
                        const Text('بيانات الموظف',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff2ba4c8),
                                fontWeight: FontWeight.w100),
                            textAlign: TextAlign.right),
                        const SizedBox(
                          height: 30,
                        ),
                        if (BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .employeephoto !=
                            null)
                          CircleAvatar(
                            backgroundColor: Appcolors.maincolor,
                            radius: 60,
                            child: CircleAvatar(
                              radius: 57,
                              backgroundColor: Colors.white,
                              child: imagefromrequest(
                                  url: BlocProvider.of<showemployeescuibt>(
                                          context)
                                      .employeesdata[index]
                                      .employeephoto!,
                                  height: 100,
                                  width: 100),
                            ),
                          ),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "اسم الموظف",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .name!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "العنوان",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .address!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "الوظيفه",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .jobTitle!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "رقم الهاتف",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .phone!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "رقم البطاقه",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .cardNumber!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "التاريخ",
                            value: BlocProvider.of<showemployeescuibt>(context)
                                .employeesdata[index]
                                .createdAt!),
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
