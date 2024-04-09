import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/tenants/data/model/tenantmodelrequest.dart';
import 'package:aplication/features/tenants/presentation/view/widgets/tenants.dart';
import 'package:aplication/features/tenants/presentation/viewmodel/tenants/tenant_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class addtenant extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addtenant({super.key, required this.formkey, required this.width});

  @override
  State<addtenant> createState() => _addtenantState();
}

class _addtenantState extends State<addtenant> {
  TextEditingController tenentname = TextEditingController();

  TextEditingController cardnumber = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController adress = TextEditingController();
  TextEditingController job = TextEditingController();
  TextEditingController narionality = TextEditingController();

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
        child: ListView(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.27,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/person.png',
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('تسجيل المستاجرين',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color(0xff2ba4c8),
                            fontWeight: FontWeight.w100),
                        textAlign: TextAlign.right),
                    const SizedBox(
                      height: 15,
                    ),
                    custommytextform(
                      controller: tenentname,
                      hintText: "اسم المستاجر",
                      val: "برجاء ادخال اسم المستاجر",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: phone,
                      hintText: "رقم الهاتف",
                      val: "برجاء ادخال رقم الهاتف",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: cardnumber,
                      hintText: "رقم البطاقه",
                      val: "برجاء ادخال رقم البطاقه",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: adress,
                      hintText: "العنوان الموجود في البطاقه",
                      val: "برجاء ادخال العنوان الموجود في البطاقه",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: job,
                      hintText: "الوظيفه",
                      val: "برجاء ادخال الوظيفه",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    custommytextform(
                      controller: narionality,
                      hintText: "الجنسيه",
                      val: "برجاء ادخال الجنسيه",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BlocConsumer<TenantCubit, TenantState>(
                        listener: (context, state) {
                      if (state is AddTenantfailure)
                        showsnack(
                            comment: state.error_message, context: context);
                      if (state is AddTenantsuccess) {
                        tenentname.clear();
                        adress.clear();
                        job.clear();
                        narionality.clear();
                        cardnumber.clear();
                        phone.clear();
                        navigateandfinish(
                            navigationscreen: Tenants(), context: context);
                        showsnack(
                            comment: state.success_message, context: context);
                      }
                    }, builder: (context, state) {
                      if (state is AddTenantloading) return loading();
                      return custommaterialbutton(
                          onPressed: () async {
                            if (widget.formkey.currentState!.validate()) {
                              BlocProvider.of<TenantCubit>(context).addtenant(
                                  token: cashhelper.getdata(key: "token"),
                                  tenant: tenentmodelrequest(
                                      name: tenentname.text,
                                      cardnumber: cardnumber.text,
                                      phone: phone.text,
                                      adress: adress.text,
                                      job: job.text,
                                      nationality: narionality.text));
                            }
                          },
                          button_name: "تسجيل البيانات",
                          buttonicon: Icons.save);
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tenentname.dispose();

    cardnumber.dispose();

    phone.dispose();

    adress.dispose();
    job.dispose();
    narionality.dispose();
    super.dispose();
  }
}
