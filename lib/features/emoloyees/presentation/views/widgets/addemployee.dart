import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/showdialogerror.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/employees_powers.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/customchoosedate.dart';
import 'package:aplication/features/aqarat/presentation/views/widgets/custommytextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/emoloyees/data/models/addemployeerequest.dart';
import 'package:aplication/features/emoloyees/presentation/viewmodel/addemployee/addemployee_cubit.dart';
import 'package:aplication/features/emoloyees/presentation/views/widgets/uploadimage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addemplyee extends StatefulWidget {
  final GlobalKey<FormState> formkey;
  final double width;

  addemplyee({super.key, required this.formkey, required this.width});

  @override
  State<addemplyee> createState() => _addemplyeeState();
}

class _addemplyeeState extends State<addemplyee> {
  TextEditingController employeename = TextEditingController();

  TextEditingController jobdescription = TextEditingController();

  TextEditingController adrees = TextEditingController();

  TextEditingController cardnumber = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();

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
            children: [
              Image.asset(
                'images/people.png',
                height: 50,
                width: 50,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('تسجيل الموظفين',
                  style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff2ba4c8),
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.right),
              const SizedBox(
                height: 15,
              ),
              custommytextform(
                controller: employeename,
                hintText: "اسم الموظف",
                val: "برجاء ادخال اسم الموظف",
              ),
              const SizedBox(
                height: 10,
              ),
              custommytextform(
                controller: jobdescription,
                hintText: "المسمي الوطيفي",
                val: "برجاء ادخال المسمي الوظيفي",
              ),
              const SizedBox(
                height: 10,
              ),
              custommytextform(
                controller: adrees,
                hintText: "العنوان",
                val: "برجاء ادخال العنوان",
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
                controller: phone,
                hintText: "رقم الهاتف",
                val: "برجاء ادخال رقم الهاتف",
              ),
              const SizedBox(
                height: 10,
              ),
              custommytextform(
                controller: password,
                hintText: "كلمة السر",
                val: "برجاء ادخال كلمة السر",
              ),
              const SizedBox(
                height: 10,
              ),
              pikeemployeeimage(),
              Center(
                child: BlocBuilder<AddemployeeCubit, AddemployeeState>(
                  builder: (context, state) {
                    return BlocProvider.of<AddemployeeCubit>(context).image !=
                            null
                        ? Stack(
                            alignment: Alignment.topRight,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                    BlocProvider.of<AddemployeeCubit>(context)
                                        .image!),
                              ),
                              IconButton(
                                  onPressed: () {
                                    BlocProvider.of<AddemployeeCubit>(context)
                                        .resetimage();
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          )
                        : const SizedBox();
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Color(0xff2BA4C8), width: 0.5)),
                child: const EmployessPowers(),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocConsumer<AddemployeeCubit, AddemployeeState>(
                listener: (context, state) {
                  if (state is Addemployeefailure) {
                    showsnack(comment: state.error_message, context: context);
                  }
                  if (state is Addemployeesuccess) {
                    BlocProvider.of<AddemployeeCubit>(context)
                        .selecteditems
                        .clear();
                    BlocProvider.of<AddemployeeCubit>(context).image = null;
                    employeename.clear();
                    adrees.clear();
                    jobdescription.clear();
                    password.clear();
                    phone.clear();
                    cardnumber.clear();

                    showsnack(comment: state.succes_message, context: context);
                  }
                },
                builder: (context, state) {
                  if (state is Addemployeeloading) return loading();
                  return custommaterialbutton(
                      onPressed: (() async {
                        if (widget.formkey.currentState!.validate()) {
                          if (BlocProvider.of<AddemployeeCubit>(context)
                              .selecteditems
                              .isEmpty) {
                            showdialogerror(
                                error: "يجب تحديد الصلاحيات", context: context);
                          } else {
                            var image;
                            if (BlocProvider.of<AddemployeeCubit>(context)
                                    .image !=
                                null) {
                              image = await MultipartFile.fromFile(
                                  BlocProvider.of<AddemployeeCubit>(context)
                                      .image!
                                      .path,
                                  filename:
                                      BlocProvider.of<AddemployeeCubit>(context)
                                          .image!
                                          .path
                                          .split("/")
                                          .last);
                            }
                            await BlocProvider.of<AddemployeeCubit>(context)
                                .addemployee(
                                    token: generaltoken,
                                    employee: addemployeemodel(
                                        password: password.text,
                                        name: employeename.text,
                                        phone: phone.text,
                                        employee_image: image,
                                        jobtittle: jobdescription.text,
                                        employee_address: adrees.text,
                                        card_number: cardnumber.text,
                                        permessions:
                                            BlocProvider.of<AddemployeeCubit>(
                                                    context)
                                                .getselecteditems()));
                          }
                        }
                      }),
                      button_name: "تسجيل البيانات",
                      buttonicon: Icons.data_exploration);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
