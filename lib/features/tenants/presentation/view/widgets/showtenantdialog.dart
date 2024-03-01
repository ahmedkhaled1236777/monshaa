import 'package:aplication/features/auth/profile/presentation/view/widgets/customdescription.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class showtenantdialog extends StatelessWidget {
  final int index;
  final Widget child;
  const showtenantdialog({super.key, required this.index, required this.child});
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
                        const Text('بيانات المستاجر',
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff2ba4c8),
                                fontWeight: FontWeight.w100),
                            textAlign: TextAlign.right),
                        const SizedBox(
                          height: 100,
                        ),
                        customdescription(
                            description: "اسم المستأجر",
                            value: BlocProvider.of<TenantCubit>(context)
                                .tenantdata[index]
                                .name!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "رقم الهاتف",
                            value: BlocProvider.of<TenantCubit>(context)
                                .tenantdata[index]
                                .phone!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "عنوان المستأجر",
                            value: BlocProvider.of<TenantCubit>(context)
                                .tenantdata[index]
                                .name!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "رقم البطاقه",
                            value: BlocProvider.of<TenantCubit>(context)
                                .tenantdata[index]
                                .cardNumber!),
                        const SizedBox(
                          height: 15,
                        ),
                        customdescription(
                            description: "الجنسيه",
                            value: BlocProvider.of<TenantCubit>(context)
                                .tenantdata[index]
                                .nationality!),
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
