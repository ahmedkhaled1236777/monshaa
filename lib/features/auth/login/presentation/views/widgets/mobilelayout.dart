import 'dart:async';

import 'package:aplication/core/color/appcolors.dart';
import 'package:aplication/core/commn/navigation.dart';
import 'package:aplication/core/commn/sharedpref/cashhelper.dart';
import 'package:aplication/core/textes/textes.dart';
import 'package:aplication/core/commn/loading.dart';
import 'package:aplication/core/sizes/appsizes.dart';
import 'package:aplication/core/commn/toast.dart';
import 'package:aplication/features/auth/login/data/models/loginrequest.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customimage.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/custommaterialbutton.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/customtextform.dart';
import 'package:aplication/features/auth/login/presentation/views/widgets/noaccount.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/logincuibt.dart';
import 'package:aplication/features/auth/login/presentation/viewsmodel/logincuibt/loginstates.dart';
import 'package:aplication/features/auth/register/presentation/views/register.dart';
import 'package:aplication/features/home/presentation/views/home.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Mobilelayout extends StatefulWidget {
  @override
  State<Mobilelayout> createState() => _MobilelayoutState();
}

class _MobilelayoutState extends State<Mobilelayout> {
  String? token;
  gettoken() async {
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    await _firebaseMessaging.getToken().then((token) {
      cashhelper.setdata(key: "devicetoken", value: token);
      print(token);
      this.token = token;
    });
  }

  @override
  initState() {
    gettoken();
  }

  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();

  bool obscureText = true;

  IconData passicon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      width: double.infinity,
      child: Form(
          key: formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Align(
                    alignment: Alignment.center,
                    child: customimage(
                        width: width * 0.2,
                        height: height * 0.2,
                        imagename: "images/building.png")),
                const SizedBox(
                  height: Appsizes.size40,
                ),
                const Text(Apptextes.login,
                    style: TextStyle(
                        fontSize: 12.5,
                        color: Color(0xff2ba4c8),
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.right),
                const SizedBox(
                  height: Appsizes.size20,
                ),
                customtextform(
                    val: "برجاء ادخال رقم الهاتف",
                    controller: phone,
                    prefixicon: Icons.phone,
                    hintText: Apptextes.phone),
                const SizedBox(
                  height: Appsizes.size15,
                ),
                customtextform(
                  val: "برجاء ادخال كلمة المرور",
                  controller: password,
                  prefixicon: Icons.password,
                  hintText: Apptextes.pass,
                  obscureText: obscureText,
                  suffixIcon: IconButton(
                      onPressed: () {
                        obscureText = !obscureText;
                        passicon == Icons.visibility
                            ? passicon = Icons.visibility_off
                            : passicon = Icons.visibility;
                        setState(() {});
                      },
                      icon: Icon(passicon,
                          size: Appsizes.size20, color: Appcolors.blackcolor)),
                ),
                const SizedBox(
                  height: Appsizes.size20,
                ),
                BlocConsumer<logincuibt, loginstate>(
                    listener: (context, state) {
                  if (state is loginfailure) {
                    showsnack(comment: state.error_message, context: context);
                  } else if (state is loginsucces) {
                    password.clear();
                    phone.clear();
                    generaltoken = state.loginmodel.data!.token!;

                    cashhelper.setdata(
                        key: "logo", value: state.loginmodel.data!.logo);
                    cashhelper.setdata(
                        key: "token", value: state.loginmodel.data!.token);
                    cashhelper.setdata(
                        key: "company_name",
                        value: state.loginmodel.data!.companyName);
                    cashhelper.setdata(
                        key: "role",
                        value: state.loginmodel.data!.userType);
                    cashhelper.setdata(
                        key: "name", value: state.loginmodel.data!.name);
                    cashhelper.setdata(
                        key: "company_phone",
                        value: state.loginmodel.data!.companyPhone);
                    cashhelper.setdata(
                        key: "phone", value: state.loginmodel.data!.phone);
                    cashhelper.setdata(
                        key: "company_adress",
                        value: state.loginmodel.data!.companyAddress);
                    showsnack(
                        comment: "تم تسجيل الدخول بنجاح", context: context);
                    navigateandfinish(
                        navigationscreen: MyHomePage(), context: context);
                  }
                }, builder: (context, state) {
                  if (state is loginloading) {
                    return loading();
                  }

                  return custommaterialbutton(
                    button_name: Apptextes.login,
                    buttonicon: Icons.login,
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await BlocProvider.of<logincuibt>(context)
                            .loginpostdata(
                                login: loginrequest(
                          device_type: "android",
                          token: token!,
                          phone: phone.text,
                          password: password.text,
                        ));
                      }
                    },
                  );
                }),
                const SizedBox(
                  height: Appsizes.size10,
                ),
                noaccount(
                    maintext: Apptextes.noaccount,
                    buttontext: Apptextes.registernow,
                    navigated_widget: Register())
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    phone.dispose();

    password.dispose();
    super.dispose();
  }
}
